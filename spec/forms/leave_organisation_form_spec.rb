require 'rails_helper'

RSpec.describe LeaveOrganisationForm do
  let!(:instance) { described_class.new(params) }

  describe '.save' do
    subject(:save_form) { instance.save }
    context 'given invalid params' do
      let(:params) { {} }
      it('fails') { is_expected.to be false }
    end
    context 'given valid params' do
      let(:params) do
        { user_id: user.id, organisation_id: organisation.id }
      end
      let!(:user) { Factories.user }
      let!(:organisation) { Factories.organisation }
      context 'when organisation user exists' do
        before { OrganisationUser.create(user: user, organisation: organisation) }
        it 'deletes the record' do
          expect { save_form }.to change(OrganisationUser, :count).by(-1)
        end
      end
      context 'when no organisation user exists' do
        it('fails') { is_expected.to be_falsey }
      end
    end
  end
end
