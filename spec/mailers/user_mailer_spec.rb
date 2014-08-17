require "rails_helper"

PARTS = %w(plain html)

describe UserMailer do
  let(:user) { double(first_name: 'Bobby', email: 'bobby@example.com', activation_token: '123abc') }

  describe "activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please activate your account")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["alan@example.com"])
    end

    PARTS.each do |content_type|
      context "#{content_type}" do
        let(:body) { get_body_for(mail, content_type) }

        it "greets the user" do
          expect(body).to match("Hi Bobby")
        end

        it "provides the activation URL" do
          expect(body).to match("/users/123abc/activate")
        end
      end
    end
  end

  describe "activation_success_email" do
    let(:mail) { UserMailer.activation_success_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Ten Percent News")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["alan@example.com"])
    end

    PARTS.each do |content_type|
      context "#{content_type}" do
        let(:body) { get_body_for(mail, content_type) }

        it "greets the user" do
          expect(body).to match("Hi Bobby")
        end

        it "provides the sign in URL" do
          expect(body).to match(signin_url)
        end
      end
    end
  end
end
