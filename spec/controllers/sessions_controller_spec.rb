require 'rails_helper'

describe SessionsController do
  describe 'GET new' do
    it 'renders the login page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:user)           { Fabricate(:user) }
    let(:email)          { 'bobby@example.com' }
    let(:pass)           { 'password' }
    let(:login_response) { user }

    before :each do
      allow(controller).to receive(:login).and_return(login_response)
      post :create, email: email, password: pass
    end

    it 'logs the user in' do
      expect(controller).to have_received(:login).with(email, pass)
    end

    it 'assigns the user' do
      expect(assigns[:user]).to eql(user)
    end

    context 'when login in successful' do
      let(:login_response) { user }

      it 'redirects to the root page' do
        expect(response).to redirect_to(:root)
      end

      it 'displays a success notice' do
        expect(flash[:notice]).to eql('Successfully signed in')
      end
    end

    context 'when login is not successful' do
      let(:login_response) { nil }

      it 'renders the login page' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      allow(controller).to receive(:logout)
      delete :destroy
    end

    it 'logs the user out' do
      expect(controller).to have_received(:logout)
    end

    it 'redirects to the root page' do
      expect(response).to redirect_to(:root)
    end

    it 'displays a success notice' do
      expect(flash[:notice]).to eql('Signed out')
    end
  end
end
