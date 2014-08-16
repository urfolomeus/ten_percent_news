require 'rails_helper'

feature 'As a product owner I want users to sign in to use the site' do
  scenario 'When I am not logged in I can see the Sign In link' do
    visit '/'
    expect(page).to have_link('Sign In')
  end

  scenario 'When I sign in as a valid user I am signed in' do
    visit '/signin'

    user = Fabricate(:user)

    fill_in 'email',    with: 'bobby@example.com'
    fill_in 'password', with: 'password'

    click_button 'Sign In'

    expect(page).to have_content('Hello, Bobby')
  end
end
