FactoryBot.define do
  factory :user do
    name { 'Raquel' }
    lastname { 'Silva' }
    cpf { '12345678909' }
    oab { '123456' }
    sex { 'Female' }
    birth_date { '1990-01-01' }
    city { 'São Paulo' }
    state { 'SP' }
    phone { '11987654321' }
    email { 'test@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    terms_of_use { '1' }
    confirmed_at { nil }
    confirmation_token { Devise.friendly_token[0, 20] }
    confirmation_sent_at { Time.current }
  end
end
