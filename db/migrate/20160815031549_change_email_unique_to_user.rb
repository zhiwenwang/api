class ChangeEmailUniqueToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
