class CalculateShiftLength
  class << self
    def in_minutes(shift)
      base_calculation(shift) / 1.minutes
    end

    def in_hours(shift)
      base_calculation(shift) / 1.hours
    end

    private

    def base_calculation(shift)
      shift.finish.to_time - shift.start.to_time
    end
  end
end
