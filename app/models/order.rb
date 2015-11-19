class Order < ActiveRecord::Base
  has_many :items
  has_many :products, through: :items
  belongs_to :user
  belongs_to :supermarket
  before_save :set_total

  validates :user_id, :supermarket_id, presence: true

  def subtotal
    items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end

  def set_total
    self.total = self.subtotal
  end

  def checkout
    self.uuid = nil
    self.save
  end

end
