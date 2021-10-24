defmodule Fit.Message do
  alias Fit

  @message_number_handler %{
    0x00 => Fit.Message.FileId,
    0x12 => Fit.Message.Session,
    0x13 => Fit.Message.Lap,
    0x14 => Fit.Message.Record,
    0x15 => Fit.Message.Event,
    0x22 => Fit.Message.Activity
  }

  def from_binary(fit, header, data) do
    message_definition = Map.fetch!(fit.definitions, header.local_message_type)

    mesg_num = message_definition.mesg_num

    mod = @message_number_handler[mesg_num]
    if !mod do
      raise "No module defined for message number 0x#{Integer.to_string(mesg_num, 16)}"
    end
    fields = mod.fields

    message = struct!(mod)

    {data, message} = Enum.reduce(
      message_definition.fields,
      {data, message},
      fn {message_field_num, _size, fit_base_type}, {data, message} ->
        field = Enum.find(fields, &(&1.number == message_field_num))
        if !field do
          raise "No field with number 0x#{Integer.to_string(message_field_num, 16)} defined for #{mod}"
        end
        {value, data} = read_field(data, fit_base_type)
        message = Map.replace!(message, field.name, value)
        {data, message}
      end
    )

    messages = [message | fit.messages]
    fit = Map.replace!(fit, :messages, messages)

    {:ok, fit, data}
  end

  defp read_field(data, fit_base_type)
  defp read_field(<<value::signed-8, data::binary>>, :int8), do: {value, data}
  defp read_field(<<value::8, data::binary>>, :uint8), do: {value, data}
  defp read_field(<<value::signed-16, data::binary>>, :int16), do: {value, data}
  defp read_field(<<value::16, data::binary>>, :uint16), do: {value, data}
  defp read_field(<<value::signed-32, data::binary>>, :int32), do: {value, data}
  defp read_field(<<value::32, data::binary>>, :uint32), do: {value, data}
  defp read_field(<<value::32, data::binary>>, :uint32z), do: {value, data}
end
