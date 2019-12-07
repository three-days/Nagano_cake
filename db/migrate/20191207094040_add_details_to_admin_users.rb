class AddDetailsToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :admin_email, :string
    add_column :admin_users, :admin_password, :string
  end
end
