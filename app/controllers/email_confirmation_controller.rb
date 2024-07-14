class EmailConfirmationController < ApplicationController
  skip_before_action :authenticate_user!, only: [:confirm, :send_confirmation_email_request]

  def confirm
    user = User.find_by(confirmation_token: params[:confirmation_token])
    if user && !user.confirmed?
      user.confirm
      flash[:notice] = 'Seu email foi confirmado com sucesso.'
      redirect_to root_path
    else
      flash[:alert] = 'Link de confirmação inválido.'
      redirect_to root_path
    end
  end


  def send_confirmation_email_request
    user = User.find_by(email: params[:email])
    if user && !user.confirmed?
      user.send_confirmation_instructions
      flash[:notice] = 'Enviamos um email de confirmação para você. Por favor, verifique sua caixa de entrada ou sua pasta de spam para concluir seu cadastro.'
      redirect_to confirm_email_path(confirmation_token: user.confirmation_token)
    elsif user && user.confirmed?
      flash[:alert] = 'Usuário já confirmado.'
      redirect_to root_path
    else
      flash[:alert] = 'Usuário não encontrado ou já confirmado.'
      redirect_to root_path
    end
  end
end
