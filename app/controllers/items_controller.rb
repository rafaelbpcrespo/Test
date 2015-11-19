class ItemsController < ApplicationController

  def create
    @order = current_order
    @product = Product.find(params[:item][:product_id])
    if ( @order.items.empty? || @order.supermarket == @product.supermarket )
      if @order.products.include? Product.find(@product.id)
        @item = @order.items.find_by_product_id(@product.id)
        @item.quantity += params[:item][:quantity].to_i
        @item.save
      else
        @item = @order.items.new(item_params)
        @order.supermarket = Product.find(params[:item][:product_id]).supermarket
      end
      @order.save
      current_order = @order
    else
      respond_to do |format|
        format.js
      end
    end
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
