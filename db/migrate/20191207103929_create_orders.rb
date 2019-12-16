class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_charge
      t.datetime :purchase_date
      t.integer :payment_method
      t.integer :order_status
      t.integer :postage
      t.string :destination_address
      t.string :destination_name
      t.string :destination_postal_code
      t.timestamps
    end
  end
end
