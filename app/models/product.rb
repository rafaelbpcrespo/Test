class Product < ActiveRecord::Base
  belongs_to :supermarket

  validates :name, :price, :supermarket_id, presence: true
end
