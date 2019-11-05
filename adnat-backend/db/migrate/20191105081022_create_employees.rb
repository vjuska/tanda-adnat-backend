class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :org_id
      t.string :user_id

      t.timestamps
    end
  end
end
