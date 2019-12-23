require 'rails_helper'

RSpec.describe 'Test', type: :system do
  it do
    it_requires_login
  end

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
end
