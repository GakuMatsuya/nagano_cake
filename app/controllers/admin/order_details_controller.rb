class Admin::OrderDetailsController < ApplicationController

   before_action :authenticate_admin!

  def update
    @ordered_item = OrderedItem.find(params[:id])
    @order = Order.find(@ordered_item.order_id)
      if @ordered_item.status != ordered_item_params[:status]
        @ordered_item.update(status: ordered_item_params[:status])
        if @ordered_item.status == "production"
          @order.update(status: 2)
        end
      end
    
    a = @order.ordered_items.where(status: "production_completed")
    b = @order.ordered_items
    
    if a.count == b.count
      @order.update(status: 3)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end
  
end
