class Supermarket < ActiveRecord::Base
  belongs_to :cep
  validates :name, :cep_id, presence: true
end
