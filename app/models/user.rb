class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Custom fields
  attr_accessor :name, :lastname, :cpf, :oab, :sex, :birth_date, :city, :state, :phone, :terms_of_use
end
