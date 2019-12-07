class ChangeNotnullToAdminUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :admin_users, :admin_email, false
	change_column_null :admin_users, :admin_password, false
  end
end
