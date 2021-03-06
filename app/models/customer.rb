class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  enum is_active:{
    effectiveness:        true,
    withdrawn:            false
   }

  def active_for_authentication?
    super && (self.is_active == "effectiveness")
  end

end
