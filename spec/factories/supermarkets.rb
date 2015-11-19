FactoryGirl.define do
  factory :supermarket do
    sequence(:name) { |n| "Supermarket #{n}" }
    cep
  end

end
