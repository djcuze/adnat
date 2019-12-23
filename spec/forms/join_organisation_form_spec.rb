require 'rails_helper'

RSpec.describe JoinOrganisationForm do
  let!(:instance) { described_class.new(params) }
  let!(:user) { Factories.user }
  let!(:organisation) { Factories.organisation }

  describe '.save' do
    subject(:save_form) { instance.save }
    context 'given invalid params' do
      let(:params) { {} }
      it('fails') { is_expected.to be false }
    end
    context 'given a valid user id and organisation id' do
      let(:params) do
        { user_id: user.id, organisation_id: organisation.id }
      end
      context 'when no organisation user exists for provided ids' do
        it 'creates an organisation user record' do
          expect { save_form }.to change(OrganisationUser, :count).by(1)
        end
      end
      context 'when organisation user already exists for provided ids' do
        before { OrganisationUser.create(user: user, organisation: organisation) }
        it('fails') { is_expected.to be false }
        it 'returns an error message' do
          save_form
          expect(instance.errors.full_messages).to include(I18n.t('organisation.join.error'))
        end
      end
    end
  end
end
