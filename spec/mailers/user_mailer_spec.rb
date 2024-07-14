
require 'rails_helper'
RSpec.describe RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  after do
    User.destroy_all  
    ActionMailer::Base.deliveries.clear  
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        user: {
          name: 'John Doe',
          lastname: 'Doe',
          cpf: '12345678900',
          oab: 'OAB12345',
          sex: 'Male',
          birth_date: Date.new(1990, 1, 1),
          city: 'City',
          state: 'State',
          phone: '123456789',
          email: 'john.doe@example.com',
          password: 'password',
          password_confirmation: 'password',
          terms_of_use: '1'
        }
      }
    end

    it 'creates a new user and sends confirmation email' do
      expect {
        post :create, params: valid_params
      }.to change(User, :count).by(1)

      user = User.last
      expect(user.confirmed_at).to be_nil 

      
      expect(response).to redirect_to(pending_confirmation_path)

      
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      expect(ActionMailer::Base.deliveries.last.subject).to eq('Confirmation instructions')
      expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
    end
  end
end
