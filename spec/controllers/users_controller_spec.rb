require 'rails_helper'

describe UsersController do
  describe 'GET new' do
    it "assigns a new user" do
      get :new
      expect(assigns[:user]).to be_new_record
      expect(assigns[:user]).to be_a(User)
    end

    it "renders the new page" do
      get :new
      expect(response).to render_template(:new)
    end

    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    let(:user)          { Fabricate.build(:user) }
    let(:user_params)   { Fabricate.attributes_for(:user) }
    let(:save_response) { true }

    before :each do
      allow(User).to receive('new').and_return(user)
      allow(user).to receive('save').and_return(save_response)
      post :create, user: user_params
    end

    it "builds a new user" do
      expect(User).to have_received('new').with(user_params)
    end

    it "assigns the user" do
      expect(assigns[:user]).to eql(user)
    end

    it 'saves the user' do
      expect(user).to have_received(:save)
    end

    context 'when saved successfully' do
      let(:save_response) { true }

      it "redirects to the root page" do
        expect(response).to redirect_to(:root)
      end

      it "shows the user a success notice" do
        expect(flash[:notice]).to eql('Successfully signed up')
      end
    end

    context 'when not saved successful' do
      let(:save_response) { false }

      it 'renders the new page' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET activate' do
    let(:user)       { Fabricate.build(:pending_user) }
    let(:successful) { true }

    before :each do
      allow(User).to receive(:load_from_activation_token).and_return(user)
      allow(user).to receive(:activate!).and_return(successful)
      get :activate, id: '123abc'
    end

    it 'fetches the user' do
      expect(User).to have_received(:load_from_activation_token).with('123abc')
    end

    it 'assigns the user' do
      expect(assigns[:user]).to eql(user)
    end

    context 'when successful' do
      let(:successful) { true }

      it 'activates the user' do
        expect(user).to have_received(:activate!)
      end

      it 'redirects to the sign in page' do
        expect(response).to redirect_to(:signin)
      end

      it 'displays a success notice' do
        expect(flash[:notice]).to eq('User was successfully activated.')
      end
    end

    context 'when not successful' do
      let(:successful) { false }

      it 'is not authenticated' do
        expect(response.status).to eql(302)
      end
    end
  end
end
