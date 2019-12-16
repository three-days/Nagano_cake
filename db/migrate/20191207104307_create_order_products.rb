class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :number
      t.integer :tax_included
      t.integer :production_status
      t.timestamps
    end
  end
end
