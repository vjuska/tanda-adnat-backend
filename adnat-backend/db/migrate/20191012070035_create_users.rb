class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :password

      t.timestamps
    end
  end
end
