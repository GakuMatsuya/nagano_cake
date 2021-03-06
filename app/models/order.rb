class Order < ApplicationRecord

  enum status:{
    waiting_for_payment:    0, #入金待ち
    payment_confirmation:   1, #入金確認
    production:             2, #製作中
    preparing_to_ship:      3, #発送準備中
    sent:                   4, #発送済み
  }

  enum payment_method:{
    credit_card:    0,
    bank_transfer:  1,
  }

  belongs_to :customer
  has_many :ordered_items, dependent: :destroy
  accepts_nested_attributes_for :ordered_items, allow_destroy: true

  def calculate_ordered_item
    sum = 0
    self.ordered_items.each do |oi|
      sum += oi.amount
    end
    
    sum
  end
  
  def calculate_total_price
    sum = 0
    self.ordered_items.each do |oi|
      sum = sum + oi.price_including_tax * oi.amount
    end
    
    sum
  end

end
