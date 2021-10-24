defmodule Fit.Message.FileId do
  defstruct ~w(
    type
    manufacturer
    product
    serial_number
    time_created
    number
    product_name
  )a

  @fields [
    %{number: 0, name: :type, type: :enum},
    %{number: 1, name: :manufacturer, type: :manufacturer},
    %{number: 2, name: :product, type: :uint16},
    %{number: 3, name: :serial_number, type: :uint32z},
    %{number: 4, name: :time_created, type: :date_time},
    %{number: 5, name: :number, type: :uint16},
    %{number: 8, name: :product_name, type: :string}
  ]

  def fields, do: @fields
end
