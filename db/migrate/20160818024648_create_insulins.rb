class CreateInsulins < ActiveRecord::Migration[5.0]
  def change
    create_table :insulins do |t|
      t.string :serial_number
      t.string :device_id
      t.datetime :date
      t.float :insulin_value
      t.integer :user_id

      t.timestamps
    end
  end
end
