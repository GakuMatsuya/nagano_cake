class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy
  attachment :image
  
  enum is_active: { "販売中": true, "販売停止中": false }
  validates :is_active, inclusion: {in: ["販売中", "販売停止中"]}
end
