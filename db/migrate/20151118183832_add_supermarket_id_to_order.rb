class AddSupermarketIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :supermarket_id, :integer
  end
end
