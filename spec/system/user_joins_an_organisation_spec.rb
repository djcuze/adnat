require 'rails_helper'

RSpec.describe 'User joins an organisation', type: :system do
  let!(:user) { Factories.user }
  let!(:organisation) { Factories.organisation }

  before do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  it do
    it_edits_an_organisation
  end

  private

  def it_edits_an_organisation
    within '.organisations-list' do
      click_button 'Join'
    end

    page.has_content? "Logged into organisation: #{organisation.name}"
  end
end
