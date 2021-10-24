defmodule Fit.Message.Session do
  defstruct ~w(
    event
    event_type
    start_time
    start_position_lat
    start_position_long
    sport
    sub_sport
    total_elapsed_time
    total_timer_time
    total_distance
    total_cycles
    total_calories
    total_fat_calories
    avg_speed
    max_speed
    avg_heart_rate
    max_heart_rate
    avg_cadence
    max_cadence
    avg_power
    max_power
    total_ascent
    total_descent
    total_training_effect
    first_lap_index
    num_laps
    event_group
    trigger
    nec_lat
    nec_long
    swc_lat
    swc_long
    num_lengths
    normalized_power
    training_stress_score
    intensity_factor
    left_right_balance
    avg_stroke_count
    avg_stroke_distance
    swim_stroke
    pool_length
    threshold_power
    pool_length_unit
    num_active_lengths
    total_work
    avg_altitude
    max_altitude
    gps_accuracy
    avg_grade
    avg_pos_grade
    avg_neg_grade
    max_pos_grade
    max_neg_grade
    avg_temperature
    max_temperature
    total_moving_time
    avg_pos_vertical_speed
    avg_neg_vertical_speed
    max_pos_vertical_speed
    max_neg_vertical_speed
    min_heart_rate
    time_in_hr_zone
    time_in_speed_zone
    time_in_cadence_zone
    time_in_power_zone
    avg_lap_time
    best_lap_index
    min_altitude
    player_score
    opponent_score
    opponent_name
    stroke_count
    zone_count
    max_ball_speed
    avg_ball_speed
    avg_vertical_oscillation
    avg_stance_time_percent
    avg_stance_time
    avg_fractional_cadence
    max_fractional_cadence
    total_fractional_cycles
    avg_total_hemoglobin_conc
    min_total_hemoglobin_conc
    max_total_hemoglobin_conc
    avg_saturated_hemoglobin_percent
    min_saturated_hemoglobin_percent
    max_saturated_hemoglobin_percent
    avg_left_torque_effectiveness
    avg_right_torque_effectiveness
    avg_left_pedal_smoothness
    avg_right_pedal_smoothness
    avg_combined_pedal_smoothness
    sport_index
    time_standing
    stand_count
    avg_left_pco
    avg_right_pco
    avg_left_power_phase
    avg_left_power_phase_peak
    avg_right_power_phase
    avg_right_power_phase_peak
    avg_power_position
    max_power_position
    avg_cadence_position
    max_cadence_position
    enhanced_avg_speed
    enhanced_max_speed
    enhanced_avg_altitude
    enhanced_min_altitude
    enhanced_max_altitude
    avg_lev_motor_power
    max_lev_motor_power
    lev_battery_consumption
    avg_vertical_ratio
    avg_stance_time_balance
    avg_step_length
    total_anaerobic_training_effect
    avg_vam
    total_grit
    total_flow
    jump_count
    avg_grit
    avg_flow
    total_fractional_ascent
    total_fractional_descent
    avg_core_temperature
    min_core_temperature
    max_core_temperature
    message_index
    timestamp
  )a

  @fields [
    %{number: 0, name: :event, type: :event},
    %{number: 1, name: :event_type, type: :event_type},
    %{number: 2, name: :start_time, type: :date_time},
    %{number: 3, name: :start_position_lat, type: :sint32},
    %{number: 4, name: :start_position_long, type: :sint32},
    %{number: 5, name: :sport, type: :sport},
    %{number: 6, name: :sub_sport, type: :sub_sport},
    %{number: 7, name: :total_elapsed_time, type: :uint32},
    %{number: 8, name: :total_timer_time, type: :uint32},
    %{number: 9, name: :total_distance, type: :uint32},
    %{number: 10, name: :total_cycles, type: :uint32},
    %{number: 11, name: :total_calories, type: :uint16},
    %{number: 13, name: :total_fat_calories, type: :uint16},
    %{number: 14, name: :avg_speed, type: :uint16},
    %{number: 15, name: :max_speed, type: :uint16},
    %{number: 16, name: :avg_heart_rate, type: :uint8},
    %{number: 17, name: :max_heart_rate, type: :uint8},
    %{number: 18, name: :avg_cadence, type: :uint8},
    %{number: 19, name: :max_cadence, type: :uint8},
    %{number: 20, name: :avg_power, type: :uint16},
    %{number: 21, name: :max_power, type: :uint16},
    %{number: 22, name: :total_ascent, type: :uint16},
    %{number: 23, name: :total_descent, type: :uint16},
    %{number: 24, name: :total_training_effect, type: :uint8},
    %{number: 25, name: :first_lap_index, type: :uint16},
    %{number: 26, name: :num_laps, type: :uint16},
    %{number: 27, name: :event_group, type: :uint8},
    %{number: 28, name: :trigger, type: :session_trigger},
    %{number: 29, name: :nec_lat, type: :sint32},
    %{number: 30, name: :nec_long, type: :sint32},
    %{number: 31, name: :swc_lat, type: :sint32},
    %{number: 32, name: :swc_long, type: :sint32},
    %{number: 33, name: :num_lengths, type: :uint16},
    %{number: 34, name: :normalized_power, type: :uint16},
    %{number: 35, name: :training_stress_score, type: :uint16},
    %{number: 36, name: :intensity_factor, type: :uint16},
    %{number: 37, name: :left_right_balance, type: :left_right_balance_100},
    %{number: 41, name: :avg_stroke_count, type: :uint32},
    %{number: 42, name: :avg_stroke_distance, type: :uint16},
    %{number: 43, name: :swim_stroke, type: :swim_stroke},
    %{number: 44, name: :pool_length, type: :uint16},
    %{number: 45, name: :threshold_power, type: :uint16},
    %{number: 46, name: :pool_length_unit, type: :display_measure},
    %{number: 47, name: :num_active_lengths, type: :uint16},
    %{number: 48, name: :total_work, type: :uint32},
    %{number: 49, name: :avg_altitude, type: :uint16},
    %{number: 50, name: :max_altitude, type: :uint16},
    %{number: 51, name: :gps_accuracy, type: :uint8},
    %{number: 52, name: :avg_grade, type: :sint16},
    %{number: 53, name: :avg_pos_grade, type: :sint16},
    %{number: 54, name: :avg_neg_grade, type: :sint16},
    %{number: 55, name: :max_pos_grade, type: :sint16},
    %{number: 56, name: :max_neg_grade, type: :sint16},
    %{number: 57, name: :avg_temperature, type: :sint8},
    %{number: 58, name: :max_temperature, type: :sint8},
    %{number: 59, name: :total_moving_time, type: :uint32},
    %{number: 60, name: :avg_pos_vertical_speed, type: :sint16},
    %{number: 61, name: :avg_neg_vertical_speed, type: :sint16},
    %{number: 62, name: :max_pos_vertical_speed, type: :sint16},
    %{number: 63, name: :max_neg_vertical_speed, type: :sint16},
    %{number: 64, name: :min_heart_rate, type: :uint8},
    %{number: 65, name: :time_in_hr_zone, type: :uint32},
    %{number: 66, name: :time_in_speed_zone, type: :uint32},
    %{number: 67, name: :time_in_cadence_zone, type: :uint32},
    %{number: 68, name: :time_in_power_zone, type: :uint32},
    %{number: 69, name: :avg_lap_time, type: :uint32},
    %{number: 70, name: :best_lap_index, type: :uint16},
    %{number: 71, name: :min_altitude, type: :uint16},
    %{number: 82, name: :player_score, type: :uint16},
    %{number: 83, name: :opponent_score, type: :uint16},
    %{number: 84, name: :opponent_name, type: :string},
    %{number: 85, name: :stroke_count, type: :uint16},
    %{number: 86, name: :zone_count, type: :uint16},
    %{number: 87, name: :max_ball_speed, type: :uint16},
    %{number: 88, name: :avg_ball_speed, type: :uint16},
    %{number: 89, name: :avg_vertical_oscillation, type: :uint16},
    %{number: 90, name: :avg_stance_time_percent, type: :uint16},
    %{number: 91, name: :avg_stance_time, type: :uint16},
    %{number: 92, name: :avg_fractional_cadence, type: :uint8},
    %{number: 93, name: :max_fractional_cadence, type: :uint8},
    %{number: 94, name: :total_fractional_cycles, type: :uint8},
    %{number: 95, name: :avg_total_hemoglobin_conc, type: :uint16},
    %{number: 96, name: :min_total_hemoglobin_conc, type: :uint16},
    %{number: 97, name: :max_total_hemoglobin_conc, type: :uint16},
    %{number: 98, name: :avg_saturated_hemoglobin_percent, type: :uint16},
    %{number: 99, name: :min_saturated_hemoglobin_percent, type: :uint16},
    %{number: 100, name: :max_saturated_hemoglobin_percent, type: :uint16},
    %{number: 101, name: :avg_left_torque_effectiveness, type: :uint8},
    %{number: 102, name: :avg_right_torque_effectiveness, type: :uint8},
    %{number: 103, name: :avg_left_pedal_smoothness, type: :uint8},
    %{number: 104, name: :avg_right_pedal_smoothness, type: :uint8},
    %{number: 105, name: :avg_combined_pedal_smoothness, type: :uint8},
    %{number: 111, name: :sport_index, type: :uint8},
    %{number: 112, name: :time_standing, type: :uint32},
    %{number: 113, name: :stand_count, type: :uint16},
    %{number: 114, name: :avg_left_pco, type: :sint8},
    %{number: 115, name: :avg_right_pco, type: :sint8},
    %{number: 116, name: :avg_left_power_phase, type: :uint8},
    %{number: 117, name: :avg_left_power_phase_peak, type: :uint8},
    %{number: 118, name: :avg_right_power_phase, type: :uint8},
    %{number: 119, name: :avg_right_power_phase_peak, type: :uint8},
    %{number: 120, name: :avg_power_position, type: :uint16},
    %{number: 121, name: :max_power_position, type: :uint16},
    %{number: 122, name: :avg_cadence_position, type: :uint8},
    %{number: 123, name: :max_cadence_position, type: :uint8},
    %{number: 124, name: :enhanced_avg_speed, type: :uint32},
    %{number: 125, name: :enhanced_max_speed, type: :uint32},
    %{number: 126, name: :enhanced_avg_altitude, type: :uint32},
    %{number: 127, name: :enhanced_min_altitude, type: :uint32},
    %{number: 128, name: :enhanced_max_altitude, type: :uint32},
    %{number: 129, name: :avg_lev_motor_power, type: :uint16},
    %{number: 130, name: :max_lev_motor_power, type: :uint16},
    %{number: 131, name: :lev_battery_consumption, type: :uint8},
    %{number: 132, name: :avg_vertical_ratio, type: :uint16},
    %{number: 133, name: :avg_stance_time_balance, type: :uint16},
    %{number: 134, name: :avg_step_length, type: :uint16},
    %{number: 137, name: :total_anaerobic_training_effect, type: :uint8},
    %{number: 139, name: :avg_vam, type: :uint16},
    %{number: 181, name: :total_grit, type: :float32},
    %{number: 182, name: :total_flow, type: :float32},
    %{number: 183, name: :jump_count, type: :uint16},
    %{number: 186, name: :avg_grit, type: :float32},
    %{number: 187, name: :avg_flow, type: :float32},
    %{number: 199, name: :total_fractional_ascent, type: :uint8},
    %{number: 200, name: :total_fractional_descent, type: :uint8},
    %{number: 208, name: :avg_core_temperature, type: :uint16},
    %{number: 209, name: :min_core_temperature, type: :uint16},
    %{number: 210, name: :max_core_temperature, type: :uint16},
    %{number: 254, name: :message_index, type: :message_index},
    %{number: 253, name: :timestamp, type: :date_time}
  ]

  def fields, do: @fields
end
