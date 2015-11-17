class Order < ActiveRecord::Base
  has_many :items

  # before_save :update_subtotal
  def subtotal
    items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
