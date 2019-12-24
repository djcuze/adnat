require 'rails_helper'

RSpec.describe CalculateShiftLength do
  let!(:user) { Factories.user }

  describe '#in_minutes' do
    subject(:calculate_shift_length) { described_class.in_minutes(shift) }

    context 'given a shift starting at 8am and finishing at 12pm' do
      let(:_8_am) { Time.zone.parse('2019-01-01 08:00') }
      let(:_12_pm) { Time.zone.parse('2019-01-01 12:00') }
      let!(:shift) { Shift.create(user: user, start: _8_am, finish: _12_pm) }
      it('returns 4') { is_expected.to eq(240) }
    end
    context 'given a shift starting at 10:30pm and finishing at 4:12am' do
      let(:_10_30pm) { Time.zone.parse('2019-01-01 22:30') }
      let(:_4_12am) { Time.zone.parse('2019-01-02 04:12') }
      let!(:shift) { Shift.create(user: user, start: _10_30pm, finish: _4_12am) }
      it('returns 4') { is_expected.to eq(342) }
    end
  end

  describe '#in_hours' do
    subject(:calculate_shift_length) { described_class.in_hours(shift) }

    context 'given a shift starting at 8am and finishing at 12pm' do
      let(:_8_am) { Time.zone.parse('2019-01-01 08:00') }
      let(:_12_pm) { Time.zone.parse('2019-01-01 12:00') }
      let!(:shift) { Shift.create(user: user, start: _8_am, finish: _12_pm) }
      it('returns 4') { is_expected.to eq(4) }
    end
    context 'given a shift starting at 10:30pm and finishing at 4:12am' do
      let(:_10_30pm) { Time.zone.parse('2019-01-01 22:30') }
      let(:_4_12am) { Time.zone.parse('2019-01-02 04:12') }
      let!(:shift) { Shift.create(user: user, start: _10_30pm, finish: _4_12am) }
      it('returns 4') { is_expected.to eq(5.7) }
    end
  end
end
