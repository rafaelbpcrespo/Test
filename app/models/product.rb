class Product < ActiveRecord::Base
  belongs_to :supermarket
  has_many :items

  validates :name, :price, :supermarket_id, presence: true
end
