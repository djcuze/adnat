require 'rails_helper'

RSpec.describe 'User registers a new account', type: :system do
  it do
    it_requires_login
    it_registers_for_a_new_account
    it_creates_an_organisation
  end

  private

  def it_requires_login
    visit root_path
    page.has_content? 'Log in'
  end

  def it_registers_for_a_new_account
    click_link 'Sign up'
    fill_in 'Name', with: 'John Smith'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    page.has_content? 'Logged in as John Smith'
  end

  def it_creates_an_organisation
    page.has_content? 'Create organisation'
    fill_in 'Name', with: 'Beats R Us'
    fill_in 'Hourly rate', with: '22'
    click_button 'Create and Join'


    within '.organisations-list' do
      page.has_content? 'Beats R Us'
    end
  end
end
