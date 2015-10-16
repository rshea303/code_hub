class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
