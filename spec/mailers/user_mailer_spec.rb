require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:valid_params) {
    {
      user: {
        name: 'Raquel',
        lastname: 'Silva',
        cpf: '12345678909',
        oab: '123456',
        sex: 'Female',
        birth_date: '1990-01-01',
        city: 'São Paulo',
        state: 'SP',
        phone: '11987654321',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        terms_of_use: '1'
      }
    }
  }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: valid_params
          Rails.logger.debug "User errors: #{assigns(:user).errors.full_messages.join(", ")}"
          
        }.to change(User, :count).by(1)
      end

      it 'redirects to confirmation_pending_path' do
        post :create, params: valid_params
        expect(response).to redirect_to(pending_confirmation_path)
      end
    end
  end
end
