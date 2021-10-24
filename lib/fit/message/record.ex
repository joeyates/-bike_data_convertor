defmodule Fit.Message.Record do
  defstruct ~w(
    position_lat
    position_long
    altitude
    heart_rate
    cadence
    distance
    speed
    power
    compressed_speed_distance
    grade
    resistance
    time_from_course
    cycle_length
    temperature
    speed_1s
    cycles
    total_cycles
    compressed_accumulated_power
    accumulated_power
    left_right_balance
    gps_accuracy
    vertical_speed
    calories
    vertical_oscillation
    stance_time_percent
    stance_time
    activity_type
    left_torque_effectiveness
    right_torque_effectiveness
    left_pedal_smoothness
    right_pedal_smoothness
    combined_pedal_smoothness
    time128
    stroke_type
    zone
    ball_speed
    cadence256
    fractional_cadence
    total_hemoglobin_conc
    total_hemoglobin_conc_min
    total_hemoglobin_conc_max
    saturated_hemoglobin_percent
    saturated_hemoglobin_percent_min
    saturated_hemoglobin_percent_max
    device_index
    left_pco
    right_pco
    left_power_phase
    left_power_phase_peak
    right_power_phase
    right_power_phase_peak
    enhanced_speed
    enhanced_altitude
    battery_soc
    motor_power
    vertical_ratio
    stance_time_balance
    step_length
    absolute_pressure
    depth
    next_stop_depth
    next_stop_time
    time_to_surface
    ndl_time
    cns_load
    n2_load
    grit
    flow
    ebike_travel_range
    ebike_battery_level
    ebike_assist_mode
    ebike_assist_level_percent
    core_temperature
    timestamp
  )a

  @fields [
    %{number: 0, name: :position_lat, type: :sint32},
    %{number: 1, name: :position_long, type: :sint32},
    %{number: 2, name: :altitude, type: :uint16},
    %{number: 3, name: :heart_rate, type: :uint8},
    %{number: 4, name: :cadence, type: :uint8},
    %{number: 5, name: :distance, type: :uint32},
    %{number: 6, name: :speed, type: :uint16},
    %{number: 7, name: :power, type: :uint16},
    %{number: 8, name: :compressed_speed_distance, type: :byte},
    %{number: 9, name: :grade, type: :sint16},
    %{number: 10, name: :resistance, type: :uint8},
    %{number: 11, name: :time_from_course, type: :sint32},
    %{number: 12, name: :cycle_length, type: :uint8},
    %{number: 13, name: :temperature, type: :sint8},
    %{number: 17, name: :speed_1s, type: :uint8},
    %{number: 18, name: :cycles, type: :uint8},
    %{number: 19, name: :total_cycles, type: :uint32},
    %{number: 28, name: :compressed_accumulated_power, type: :uint16},
    %{number: 29, name: :accumulated_power, type: :uint32},
    %{number: 30, name: :left_right_balance, type: :left_right_balance},
    %{number: 31, name: :gps_accuracy, type: :uint8},
    %{number: 32, name: :vertical_speed, type: :sint16},
    %{number: 33, name: :calories, type: :uint16},
    %{number: 39, name: :vertical_oscillation, type: :uint16},
    %{number: 40, name: :stance_time_percent, type: :uint16},
    %{number: 41, name: :stance_time, type: :uint16},
    %{number: 42, name: :activity_type, type: :activity_type},
    %{number: 43, name: :left_torque_effectiveness, type: :uint8},
    %{number: 44, name: :right_torque_effectiveness, type: :uint8},
    %{number: 45, name: :left_pedal_smoothness, type: :uint8},
    %{number: 46, name: :right_pedal_smoothness, type: :uint8},
    %{number: 47, name: :combined_pedal_smoothness, type: :uint8},
    %{number: 48, name: :time128, type: :uint8},
    %{number: 49, name: :stroke_type, type: :stroke_type},
    %{number: 50, name: :zone, type: :uint8},
    %{number: 51, name: :ball_speed, type: :uint16},
    %{number: 52, name: :cadence256, type: :uint16},
    %{number: 53, name: :fractional_cadence, type: :uint8},
    %{number: 54, name: :total_hemoglobin_conc, type: :uint16},
    %{number: 55, name: :total_hemoglobin_conc_min, type: :uint16},
    %{number: 56, name: :total_hemoglobin_conc_max, type: :uint16},
    %{number: 57, name: :saturated_hemoglobin_percent, type: :uint16},
    %{number: 58, name: :saturated_hemoglobin_percent_min, type: :uint16},
    %{number: 59, name: :saturated_hemoglobin_percent_max, type: :uint16},
    %{number: 62, name: :device_index, type: :device_index},
    %{number: 67, name: :left_pco, type: :sint8},
    %{number: 68, name: :right_pco, type: :sint8},
    %{number: 69, name: :left_power_phase, type: :uint8},
    %{number: 70, name: :left_power_phase_peak, type: :uint8},
    %{number: 71, name: :right_power_phase, type: :uint8},
    %{number: 72, name: :right_power_phase_peak, type: :uint8},
    %{number: 73, name: :enhanced_speed, type: :uint32},
    %{number: 78, name: :enhanced_altitude, type: :uint32},
    %{number: 81, name: :battery_soc, type: :uint8},
    %{number: 82, name: :motor_power, type: :uint16},
    %{number: 83, name: :vertical_ratio, type: :uint16},
    %{number: 84, name: :stance_time_balance, type: :uint16},
    %{number: 85, name: :step_length, type: :uint16},
    %{number: 91, name: :absolute_pressure, type: :uint32},
    %{number: 92, name: :depth, type: :uint32},
    %{number: 93, name: :next_stop_depth, type: :uint32},
    %{number: 94, name: :next_stop_time, type: :uint32},
    %{number: 95, name: :time_to_surface, type: :uint32},
    %{number: 96, name: :ndl_time, type: :uint32},
    %{number: 97, name: :cns_load, type: :uint8},
    %{number: 98, name: :n2_load, type: :uint16},
    %{number: 114, name: :grit, type: :float32},
    %{number: 115, name: :flow, type: :float32},
    %{number: 117, name: :ebike_travel_range, type: :uint16},
    %{number: 118, name: :ebike_battery_level, type: :uint8},
    %{number: 119, name: :ebike_assist_mode, type: :uint8},
    %{number: 120, name: :ebike_assist_level_percent, type: :uint8},
    %{number: 139, name: :core_temperature, type: :uint16},
    %{number: 253, name: :timestamp, type: :date_time}
  ]

  # iex(4)> DateTime.new!(~D[1989-12-31], ~T[00:00:00.000], "Etc/UTC") |> DateTime.to_unix()
  # 63106560
  @timestamp_offset 631065600
  @coordinate_scaling Integer.pow(2, 32) / 360.0

  def fields, do: @fields

  def to_gpx(%__MODULE__{} = record) do
    lat = record.position_lat / @coordinate_scaling
    lon = record.position_long / @coordinate_scaling
    ele = (record.altitude - 3000) * 0.18652265 + 93
    time = DateTime.from_unix!(@timestamp_offset + record.timestamp)
    speed = record.speed / 100.0
    power = record.power

    trkpt = """
      <trkpt lat="#{lat}" lon="#{lon}">
        <ele>#{ele}</ele>
        <time>#{DateTime.to_iso8601(time)}</time>
        <extensions>
          <gpxtpx:TrackPointExtension>
            <gpxtpx:speed>#{speed}</gpxtpx:speed>
            <pwr:PowerInWatts>#{power}</pwr:PowerInWatts>
            <opentracks:gain>0</opentracks:gain>
            <opentracks:loss>0</opentracks:loss>
          </gpxtpx:TrackPointExtension>
        </extensions>
      </trkpt>
    """
    {:ok, trkpt}
  end
end
