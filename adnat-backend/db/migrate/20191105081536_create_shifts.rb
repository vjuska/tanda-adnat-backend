class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.string :employee_id
      t.datetime :shift_start
      t.datetime :shift_finish
      t.integer :break_length

      t.timestamps
    end
  end
end
