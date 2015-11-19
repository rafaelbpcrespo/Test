FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@carrinhoemcasa.com" }
    password 'qwertyui'
    password_confirmation 'qwertyui'
    uuid SecureRandom.uuid
  end

end
