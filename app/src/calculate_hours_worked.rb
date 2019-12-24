class CalculateHoursWorked
  class << self
    def in_minutes(shift)
      CalculateShiftLength.in_minutes(shift) - shift.break_length_in_minutes
    end

    def in_hours(shift)
      in_minutes(shift) / 60
    end
  end
end
