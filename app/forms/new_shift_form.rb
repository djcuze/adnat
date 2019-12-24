class NewShiftForm < BaseForm
  attribute :user_id, Integer
  attribute :shift_date, String
  attribute :shift_start, Time
  attribute :shift_finish, Time
  attribute :break_length_in_minutes, Integer

  private

  def persist
    Shift.transaction do
      create_shift
    end
  end

  def create_shift
    @create_shift ||= Shift.create(
      user_id:                 user_id,
      start:                   start,
      finish:                  finish,
      break_length_in_minutes: break_length_in_minutes
    )
  end

  def start
    DateTime.parse("#{shift_date} #{shift_start} Australia/Brisbane")
  end

  def finish
    DateTime.parse("#{shift_finish} #{shift_finish} Australia/Brisbane")
  end
end
