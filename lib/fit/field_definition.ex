defmodule Fit.FieldDefinition do
  @type_num_to_fit_base_type %{
    0x00 => :uint8, # "enum"
    0x01 => :int8,
    0x02 => :uint8,
    0x07 => :string,
    0x0a  => :uint8z, # ???
    0x0d => :uint8, # "byte"
    0x83 => :int16,
    0x84 => :uint16,
    0x85 => :int32,
    0x86 => :uint32,
    0x88 => :float32,
    0x89 => :float64,
    0x8b => :uint16z,
    0x8c => :uint32z, # ??
    0x8e => :int64,
    0x8f => :uint64,
    0x90 => :uint64z # ??
  }

  def from_binary(field_count, data) do
    {data, field_definitions} = Enum.reduce(
      0 .. field_count - 1,
      {data, []},
      fn _i, {<<num::8, size::8, type_num::8, data::binary>>, fields} ->
        fit_base_type = Map.fetch!(@type_num_to_fit_base_type, type_num)
        {data, [{num, size, fit_base_type} | fields]}
      end
    )

    {:ok, Enum.reverse(field_definitions), data}
  end
end
