require 'rails_helper'

feature 'As a product owner I want users to sign in to use the site' do
  scenario 'When I am not logged in I can see the Sign In link' do
    visit '/'
    expect(page).to have_link('Sign In')
  end

  context 'When I am sign in as a valid user' do
    before :each do
      visit '/signin'

      user = Fabricate(:user)

      fill_in 'email',    with: 'bobby@example.com'
      fill_in 'password', with: 'password'

      click_button 'Sign In'
    end

    scenario 'I am signed in' do
      expect(page).to have_content('Hello, Bobby')
    end

    scenario 'I can see the Sign Out link' do
      expect(page).to have_link('Sign Out')
    end

    scenario 'I can sign out' do
      visit '/'
      expect(page).to have_content('Hello, Bobby')
      click_link 'Sign Out'
      expect(page).not_to have_content('Hello, Bobby')
    end
  end
end
