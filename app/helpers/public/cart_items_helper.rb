module Public::CartItemsHelper
  
  def addTax(price)
    ((price * 1.10).round(2)).ceil
  end
  
end


