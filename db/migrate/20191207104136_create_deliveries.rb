class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :delivery_address
      t.string :delivery_name
      t.string :delivery_postal_code

      t.timestamps
    end
  end
end
