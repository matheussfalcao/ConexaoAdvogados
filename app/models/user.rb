class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  
  attr_accessor :unconfirmed_email

  
  validates :name, presence: true
  validates :lastname, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :oab, presence: true
  validates :sex, presence: true
  validates :birth_date, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :terms_of_use, acceptance: { allow_nil: false, message: 'Você precisa aceitar os termos de uso' }

  
  def confirmation_sent_at
    self[:confirmation_sent_at] || created_at if confirmed?
  end

  def confirmation_sent_at=(value)
    self[:confirmation_sent_at] = value
  end
  def confirmed?
    self.confirmed_at.present? 
  end
end