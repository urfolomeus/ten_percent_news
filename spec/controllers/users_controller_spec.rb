require 'rails_helper'

describe UsersController do
  describe 'GET new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end
end
