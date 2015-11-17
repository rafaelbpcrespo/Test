class Supermarket < ActiveRecord::Base
  has_many :products
  belongs_to :cep
  validates :name, :cep_id, presence: true
end
