require 'rails_helper'

describe 'signing up' do
  scenario 'when I am not logged in I can see the sign up link' do
    visit '/'
    expect(page).to have_link('Sign Up')
  end

  scenario 'when I click on the signup link I see the signup page' do
    visit '/'
    click_link 'Sign Up'
    expect(current_path).to eql('/signup')
  end

  scenario 'when I signup a user is created for me' do
    visit '/signup'

    fill_in 'user_first_name', with: 'Bobby'
    fill_in 'user_last_name', with: 'Tables'
    fill_in 'user_email', with: 'bobby@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign Up'

    expect(User.last.email).to eql('bobby@example.com')
  end
end
