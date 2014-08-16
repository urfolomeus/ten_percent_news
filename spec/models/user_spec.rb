require 'rails_helper'

describe User do
  describe 'validation' do
    before :each do
      subject.valid?
      expect(subject).to be_invalid
    end

    it "must have a first name" do
      expect(subject.errors[:first_name]).to include("can't be blank")
    end

    it "must have a last name" do
      expect(subject.errors[:last_name]).to include("can't be blank")
    end

    it "must have a email" do
      expect(subject.errors[:email]).to include("can't be blank")
    end

    it "must have a password_confirmation" do
      expect(subject.errors[:password_confirmation]).to include("can't be blank")
    end

    it "must have a password that matches the confirmation" do
      user = User.new(password: 'foo', password_confirmation: 'bar')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
