
class ConfirmationMailer < ApplicationMailer
  def welcome_email(user, token)
    @user = user
    @token = token

    mail(to: @user.email, subject: 'Confirmação de e-mail')
  end
end
