class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_items = CartItem.all
    @sum = 0


  end

  def index
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_thanks_path
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @sum = 0
    if params[:address_option] == '0'
       @order.address = current_customer.address
       @order.postal_code = current_customer.postal_code
       @order.name = current_customer.last_name + current_customer.first_name
    end

    address = Address.find(params[:order][:address_id])

    if params[:address_option] == '1'
      @order.address = address.address
      @order.postal_code = address.postal_code
      @order.name = address.name
    end


  end

  def thanks

  end

  private

  def order_params
    params.require(:order).permit(:address, :payment_method, :postal_code, :name, :billing_amount, :shipping_fee, :customer_id)
  end


end
