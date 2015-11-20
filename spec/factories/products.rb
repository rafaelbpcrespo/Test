FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price 1.5
    description "Product Description"
    supermarket
    image File.open("#{Rails.root}/public/images/sabonete.jpg", 'rb')
  end

end
