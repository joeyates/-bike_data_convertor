defmodule Fit.Message.Activity do
  defstruct ~w(
    total_timer_time
    num_sessions
    type
    event
    event_type
    local_timestamp
    event_group
    timestamp
  )a

  @fields [
    %{number: 0, name: :total_timer_time, type: :uint32},
    %{number: 1, name: :num_sessions, type: :uint16},
    %{number: 2, name: :type, type: :activity},
    %{number: 3, name: :event, type: :event},
    %{number: 4, name: :event_type, type: :event_type},
    %{number: 5, name: :local_timestamp, type: :local_date_time},
    %{number: 6, name: :event_group, type: :uint8},
    %{number: 253, name: :timestamp, type: :date_time}
  ]

  def fields, do: @fields
end
