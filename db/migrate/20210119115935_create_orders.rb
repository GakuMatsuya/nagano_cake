class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :status
      t.integer :billing_amount
      t.integer :shipping_fee
      t.integer :payment_method

      t.timestamps
    end
  end
end
