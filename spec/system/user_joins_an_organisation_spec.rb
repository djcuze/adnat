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
    it_joins_an_organisation
    it_leaves_organisation
  end

  private

  def it_joins_an_organisation
    within '.organisations-list' do
      click_button 'Join'
    end

    page.has_content? "Logged into organisation: #{organisation.name}"
  end

  def it_leaves_organisation
    click_button 'Leave'
    page.has_content? "Create organisation"
  end
end
