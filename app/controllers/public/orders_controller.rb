class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_items = CartItem.all
    @sum = 0
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @sum = 0
  end

  private

  def order_params
    params.require(:order).permit(:address, :payment_method, :postal_code, :name, :billing_amount, :shipping_fee)
  end


end
