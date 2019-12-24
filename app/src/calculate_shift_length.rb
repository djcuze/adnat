class CalculateShiftLength
  def self.in_minutes(shift)
    (shift.finish.to_time - shift.start.to_time) / 60.minutes
  end
end
