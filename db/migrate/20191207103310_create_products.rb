class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :product_name
      t.text :product_description
      t.integer :tax_excluded
      t.integer :sale_status

      t.timestamps
    end
  end
end
