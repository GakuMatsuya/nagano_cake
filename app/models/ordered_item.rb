class OrderedItem < ApplicationRecord
  
   enum status: {
    cannot_be_started:       0, 
    waiting_for_production:  1, 
    production:              2, 
    製作完了:3
  }

  belongs_to :order
  belongs_to :item
  
end
