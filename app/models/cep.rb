class Cep < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true

  has_many :supermarkets
end
