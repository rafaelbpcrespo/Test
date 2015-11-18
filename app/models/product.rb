class Product < ActiveRecord::Base
  belongs_to :supermarket
  has_many :items
  has_many :orders, through: :items

  validates :name, :price, :supermarket_id, presence: true
end
