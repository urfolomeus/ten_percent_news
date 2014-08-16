require 'rails_helper'

describe 'signing up' do
  scenario 'when I am not logged in I can see the sign up link' do
    visit '/'
    expect(page).to have_link('Sign Up')
  end
end
