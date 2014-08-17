require 'rails_helper'

feature 'As a product owner I want users to sign in to use the site', feature:true do
  context 'When I am not logged in' do
    scenario 'I can see the Sign Up link' do
      visit '/'
      expect(page).to have_link('Sign Up')
    end

    scenario 'I can see the Sign In link' do
      visit '/'
      expect(page).to have_link('Sign In')
    end

    scenario 'I cannot see the Sign Out link' do
      visit '/'
      expect(page).not_to have_link('Sign Out')
    end
  end

  context 'When I am sign in as a valid user' do
    before :each do
      visit '/signin'

      user = Fabricate(:active_user)

      fill_in 'email',    with: 'bobby@example.com'
      fill_in 'password', with: 'password'

      click_button 'Sign In'
    end

    scenario 'I am signed in' do
      expect(page).to have_content('Hello, Bobby')
    end

    scenario 'I cannot see the Sign Up link' do
      visit '/'
      expect(page).not_to have_link('Sign Up')
    end

    scenario 'I cannot see the Sign In link' do
      visit '/'
      expect(page).not_to have_link('Sign In')
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
