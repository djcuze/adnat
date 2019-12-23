require 'rails_helper'

RSpec.describe NewOrganisationForm do
  let!(:instance) { described_class.new(params) }

  describe '.save' do
    subject(:save_form) { instance.save }
    context 'given invalid params' do
      let(:params) { {} }
      it('fails') { is_expected.to be false }
    end
    context 'given a valid name and hourly rate' do
      let(:params) do
        { name: 'MusicLand', hourly_rate: '2240' }
      end
      it 'creates an organisation record' do
        expect { save_form }.to change(Organisation, :count).by(1)
      end
    end
  end
end
