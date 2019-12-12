class AddDeletedAtToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :deleted_at, :datetime
    add_index :genres, :deleted_at
  end
end
