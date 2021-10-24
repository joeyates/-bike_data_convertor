defmodule Fit do
  defstruct ~w(header definitions messages crc)a

  @normal 0
  @message_record 0
  @definition_record 1

  def from_binary(data) do
    {:ok, header, data} = Fit.Header.from_binary(data)
    {:ok, %__MODULE__{}} = read_messages(header, data)
  end

  defp read_messages(%Fit.Header{} = header, data) do
    {:ok, %__MODULE__{}} =
      struct!(__MODULE__, %{header: header, definitions: %{}, messages: [], crc: nil})
      |> do_read_messages(data)
  end

  defp do_read_messages(%__MODULE__{} = fit, <<crc::16>>) do
    fit =
      fit
      |> Map.replace(:crc, crc)
      |> Map.replace(:messages, Enum.reverse(fit.messages))
    {:ok, fit}
  end
  defp do_read_messages(%__MODULE__{} = fit, <<@normal::1, message_type::1, message_type_specific::1, _reserved_bits::1, local_message_type::4, data::binary>>) do
    header = %{
      header_type: 0,
      message_type: message_type,
      message_type_specific: message_type_specific,
      local_message_type: local_message_type
    }
    {:ok, fit, data} =
      case message_type do
        @message_record ->
          Fit.Message.from_binary(fit, header, data)
        @definition_record ->
          Fit.MessageDefinition.from_binary(fit, header, data)
      end
    do_read_messages(fit, data)
  end
end
