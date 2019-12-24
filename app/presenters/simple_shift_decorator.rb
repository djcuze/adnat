#
# When viewing shifts, we need to calculate
# the hours worked, and the cost of the shift
# so we use this decorator class to keep logic
# out of our view
class SimpleShiftDecorator < SimpleDelegator
  extend WrapperDecorator

  def employee_name
    user.name
  end

  def date
    start.in_time_zone('Australia/Brisbane').strftime('%d/%m/%Y')
  end

  def start_time
    start.in_time_zone('Australia/Brisbane').strftime('%-I:%M%P')
  end

  def finish_time
    finish.in_time_zone('Australia/Brisbane').strftime('%-I:%M%P')
  end

  def hours_worked
    CalculateHoursWorked.in_hours(self)
  end
end
