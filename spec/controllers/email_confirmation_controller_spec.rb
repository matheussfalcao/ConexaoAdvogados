
require 'rails_helper'
RSpec.describe EmailConfirmationController, type: :controller do
    describe 'GET #confirm' do
      it 'confirms the user and redirects to login' do
        user = create(:user, confirmed: false, confirmation_token: 'valid_token')
        get :confirm, params: { confirmation_token: user.confirmation_token }
        user.reload
        expect(user.confirmed).to be true
        expect(response).to redirect_to(new_user_session_path)
      end
  
      it 'does not confirm the user and redirects to root' do
        get :confirm, params: { confirmation_token: 'invalid_token' }
        expect(response).to redirect_to(root_path)
      end
    end
  end
  