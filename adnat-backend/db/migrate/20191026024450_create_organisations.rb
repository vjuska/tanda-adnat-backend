class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :org_name
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
