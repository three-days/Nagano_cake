class ChangeNotnullToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :users, :family_name_kanji, false
    change_column_null :users, :first_name_kanji, false
    change_column_null :users, :family_name_kana, false
    change_column_null :users, :first_name_kana, false
    change_column_null :users, :postal_code, false
    change_column_null :users, :user_address, false
    change_column_null :users, :tele_number, false
    change_column_null :users, :user_email, false
    change_column_null :users, :user_password, false
    change_column_null :users, :leave_status, false
  end
end
