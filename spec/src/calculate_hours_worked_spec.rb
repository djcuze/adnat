require 'rails_helper'

RSpec.describe CalculateHoursWorked do
  let!(:user) { Factories.user }

  describe '#in_hours' do
    subject(:calculate_hours_worked) { described_class.in_hours(shift) }

    context 'given a 4 hour shift with a 30 minute break' do
      let(:_8_am) { Time.zone.parse('2019-01-01 08:00') }
      let(:_12_pm) { Time.zone.parse('2019-01-01 12:00') }
      let!(:shift) { Shift.create(user: user, start: _8_am, finish: _12_pm, break_length_in_minutes: 30) }
      it('returns 3.5') { is_expected.to eq(3.5) }
    end
    context 'given a 6 hour shift with a 60 minute break' do
      let(:_10_30pm) { Time.zone.parse('2019-01-01 22:30') }
      let(:_4_30am) { Time.zone.parse('2019-01-02 04:30') }
      let!(:shift) { Shift.create(user: user, start: _10_30pm, finish: _4_30am, break_length_in_minutes: 60) }
      it('returns 5') { is_expected.to eq(5) }
    end
  end
end
