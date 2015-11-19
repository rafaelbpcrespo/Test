FactoryGirl.define do
  factory :cep do
    sequence(:code) { |n| "28015-0#{n}" }
  end

end
