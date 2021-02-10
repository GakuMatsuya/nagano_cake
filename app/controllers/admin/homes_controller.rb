class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.all
    @ordered_items = OrderedItem.all
    @sum = 0
  end

end
