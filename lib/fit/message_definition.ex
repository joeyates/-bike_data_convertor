defmodule Fit.MessageDefinition do
  defstruct ~w(
    arch
    field_count
    mesg_num
    fields
  )a

  def from_binary(fit, header, data) do
    <<
      0x00,
      arch::8,
      num00::8,
      num01::8,
      field_count::8,
      data::binary
    >> = data

    mesg_num = if arch == 0 do
      num00 + 0x100 * num01
    else
      0x100 * num00 + num01
    end

    {:ok, fields, data} = Fit.FieldDefinition.from_binary(field_count, data)

    values = %{
      arch: arch,
      field_count: field_count,
      mesg_num: mesg_num,
      fields: fields
    }

    message_definition = struct!(__MODULE__, values)

    definitions = Map.put(fit.definitions, header.local_message_type, message_definition)
    fit = Map.replace!(fit, :definitions, definitions)

    {:ok, fit, data}
  end
end
