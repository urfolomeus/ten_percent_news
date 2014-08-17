class UserMailer < ActionMailer::Base
  default from: "alan@example.com"

  def activation_needed_email(user)
    @user = user
    @url  = activate_user_url(user.activation_token)

    mail to: user.email,
         subject: 'Please activate your account'
  end

  def activation_success_email(user)
    @user = user
    @url  = signin_url

    mail to: user.email,
         subject: 'Welcome to Ten Percent News'
  end
end
