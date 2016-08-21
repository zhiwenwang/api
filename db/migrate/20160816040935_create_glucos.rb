class CreateGlucos < ActiveRecord::Migration[5.0]
  def change
    create_table :glucos do |t|
      t.string :serial_number
      t.string :device_id
      t.datetime :date
      t.float :bloodsugar_value
      t.integer :meal

      t.timestamps
    end
  end
end
