class CalculateShiftCost
  def self.call(shift, organisation)
    hours_worked = CalculateHoursWorked.in_hours(shift)
    (organisation.hourly_rate_in_cents / 100) * hours_worked
  end
end
