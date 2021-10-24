defmodule Fit.Header do
  defstruct ~w(
    header_size
    protocol_version
    profile_version
    data_size
    data_type
    header_crc
  )a

  def from_binary(data) do
    <<
      header_size::8,
      protocol_version::8,
      profile_version::16,
      data_size::32,
      data_type::32,
      header_crc::16,
      data::binary
    >> = data

    header = %{
      header_size: header_size,
      protocol_version: protocol_version,
      profile_version: profile_version,
      data_size: data_size,
      data_type: data_type,
      header_crc: header_crc
    }

    {:ok, struct!(__MODULE__, header), data}
  end
end
