class Order < ActiveRecord::Base
  has_many :items
  has_many :products, through: :items
  belongs_to :user
  belongs_to :supermarket

  # before_save :update_subtotal
  def subtotal
    items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end

  def checkout
    self.uuid = nil
    self.save
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
