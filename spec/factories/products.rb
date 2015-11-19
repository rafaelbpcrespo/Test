FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price 1.5
    description "Product Description"
    supermarket
  end

end
