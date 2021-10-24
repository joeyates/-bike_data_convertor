defmodule Fit.Message.Event do
  defstruct ~w(
    event
    event_type
    data16
    data
    event_group
    score
    opponent_score
    front_gear_num
    front_gear
    rear_gear_num
    rear_gear
    device_index
    radar_threat_level_max
    radar_threat_count
    timestamp
  )a

  """
  @data_type ~w(
    timer_trigger
    course_point_index
    battery_level
    virtual_partner_speed
    hr_high_alert
    hr_low_alert
    speed_high_alert
    speed_low_alert
    cad_high_alert
    cad_low_alert
    power_high_alert
    power_low_alert
    time_duration_alert
    distance_duration_alert
    calorie_duration_alert
    fitness_equipment_state
    sport_point
    gear_change_data
    rider_position
    comm_timeout
    radar_threat_alert
  )
  """

  @fields [
    %{number: 0x00, name: :event, type: :event},
    %{number: 0x01, name: :event_type, type: :event_type},
    %{number: 0x02, name: :data16, type: :uint16},
    %{number: 0x03, name: :data, type: :uint32},
    %{number: 0x04, name: :event_group, type: :uint8},
    %{number: 0x07, name: :score, type: :uint16},
    %{number: 0x08, name: :opponent_score, type: :uint16},
    %{number: 0x09, name: :front_gear_num, type: :uint8z},
    %{number: 0x0a, name: :front_gear, type: :uint8z},
    %{number: 0x0b, name: :rear_gear_num, type: :uint8z},
    %{number: 0x0c, name: :rear_gear, type: :uint8z},
    %{number: 0x0d, name: :device_index, type: :device_index},
    %{number: 0x15, name: :radar_threat_level_max, type: :radar_threat_level_type},
    %{number: 0x16, name: :radar_threat_count, type: :uint8},
    %{number: 0xfd, name: :timestamp, type: :date_time},
  ]

  def fields, do: @fields
end
