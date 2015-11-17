class ItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.items.new(item_params)
    @order.save
    current_order = @order
  end

  def update
    @order = current_order
    @item = @order.items.find(params[:id])
    @item.update_attributes(item_params)
    @items = @order.items
  end

  def destroy
    @order = current_order
    @item = @order.items.find(params[:id])
    @item.destroy
    @items = @order.items
  end

  private
    def item_params
      params.require(:item).permit(:quantity, :product_id)
    end
end
