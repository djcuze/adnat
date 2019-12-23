require 'rails_helper'

RSpec.describe EditOrganisationForm do
  let!(:instance) { described_class.new(params) }

  describe '.save' do
    subject(:save_form) { instance.save }
    context 'given invalid params' do
      let(:params) { {} }
      it('fails') { is_expected.to be false }
    end
    context 'given valid params' do
      let!(:organisation) { Factories.organisation(name: 'Apples', hourly_rate_in_cents: 1250) }
      let(:params) do
        { id: organisation.id, name: 'Barrels', hourly_rate_in_cents: 3355 }
      end
      it "updates the organisation's details" do
        save_form
        expect(organisation.reload.name).to eq('Barrels')
        expect(organisation.reload.hourly_rate_in_cents).to eq(3355)
      end
    end
  end
end