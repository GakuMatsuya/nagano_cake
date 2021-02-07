class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_customer!

  def update
    @ordered_item = OrderedItem.find(params[:id])
    @order = Order.find(@ordered_item.order_id)
    @ordered_item.update(ordered_item_params)
    redirect_to admin_order_path(@order)
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end

end
