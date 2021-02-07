class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!

  def top
    @orders = Order.all
    #@ordered_item = order.id.oedered_item
    @sum = 0
  end

end
