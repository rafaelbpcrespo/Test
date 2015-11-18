class CartsController < ApplicationController
  def show
    @items = current_order.items
  end

  def checkout
    @order = current_order
    @order.checkout
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Pedido realizado com sucesso.' }
    end
  end
end
