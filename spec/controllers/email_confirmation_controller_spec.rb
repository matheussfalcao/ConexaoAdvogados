
require 'rails_helper'

RSpec.describe EmailConfirmationController, type: :controller do
  let!(:user) { create(:user, confirmation_token: 'valid_token', confirmed_at: nil) }

  describe 'GET #confirm' do
    context 'with valid confirmation token' do
      it 'confirms the user with valid confirmation token' do
        get :confirm, params: { confirmation_token: 'valid_token' }
        user.reload
        expect(user.confirmed?).to be true
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Seu email foi confirmado com sucesso.')
      end
    end

    context 'with invalid confirmation token' do
      it 'does not confirm the user and shows alert' do
        get :confirm, params: { confirmation_token: 'invalid_token' }
        user.reload
        expect(user.confirmed?).to be false
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('Link de confirmação inválido.')
      end
    end
  end
end
