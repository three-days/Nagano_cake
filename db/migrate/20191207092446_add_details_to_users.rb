class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :family_name_kanji, :string
    add_column :users, :first_name_kanji, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
	add_column :users, :postal_code, :string
	add_column :users, :user_address, :string
	add_column :users, :tele_number, :string
	add_column :users, :user_email, :string
	add_column :users, :user_password, :string
	add_column :users, :leave_status, :boolean
  end
end
