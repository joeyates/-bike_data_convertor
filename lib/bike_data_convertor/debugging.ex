defmodule BikeDataConvertor.Debugging do
  def hexdump(binary, count) do
    size = byte_size(binary)
    count = if count < size, do: count, else: size
    for start <- 0..count - 1, rem(start, 16) == 0 do
      remainder = size - start
      chunk = if remainder >= 16 , do: 16, else: remainder
      slice = :binary.part(binary, {start, chunk})
      :binary.bin_to_list(slice)
      |> Enum.map(&(Integer.to_string(&1, 16) |> String.pad_leading(2, "0")))
      |> Enum.join(" ")
    end
    |> Enum.join("\n")
  end
end
