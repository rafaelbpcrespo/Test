class Supermarket < ActiveRecord::Base
  has_many :products
  has_many :orders
  belongs_to :cep
  validates :name, :cep_id, presence: true
end
