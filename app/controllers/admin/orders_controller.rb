class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @customer = Customer.find(@order.customer_id)
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
      if @order.status != order_params[:status]
        @order.update(status: order_params[:status])
      if @order.status == "payment_confirmation"
        @order.ordered_items.each do |ordered_item|
          ordered_item.update(status: 1)
        end
      end
      end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
   params.require(:order).permit(:status)
  end

end
