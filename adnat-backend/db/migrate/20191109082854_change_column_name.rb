class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :email, :email
    remove_column :users, :user_id
  end
end
