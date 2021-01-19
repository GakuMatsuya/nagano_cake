class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price_including_tax
      t.integer :status, default:0
      t.integer :amount

      t.timestamps
    end
  end
end
