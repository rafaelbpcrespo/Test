FactoryGirl.define do
  factory :order do
    subtotal "9.99"
    total "9.99"
    supermarket
    user
  end

end
