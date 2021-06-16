class AddNicknameToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :nickname, :string
  end
end
