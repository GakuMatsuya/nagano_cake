class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @customer = Customer.find(@order.customer_id)
    @sum = 0
  end

  def update
  end



end
