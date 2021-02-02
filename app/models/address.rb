class Address < ApplicationRecord

  def view_address
    postal_code + address + name
  end

  belongs_to :customer
end
