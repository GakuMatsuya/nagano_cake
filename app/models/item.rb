class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy
  attachment :image
  
  enum is_active:{
    sale:            true,
    stop_selling:    false
   }
end
