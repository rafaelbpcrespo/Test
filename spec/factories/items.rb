FactoryGirl.define do
  factory :item do
    product
    order
    unit_price "9.99"
    quantity 1
    total_price "9.99"
  end

end
