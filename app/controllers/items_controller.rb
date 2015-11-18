class ItemsController < ApplicationController

  def create
    @order = current_order
    if @order.products.include? Product.find(params[:item][:product_id])
      @item = @order.items.find_by_product_id(params[:item][:product_id])
      @item.quantity += params[:item][:quantity].to_i
      @item.save
    else
      @item = @order.items.new(item_params)
    end
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
      params.require(:item).permit(:quantity, :product_id, :unit_price)
    end
end
