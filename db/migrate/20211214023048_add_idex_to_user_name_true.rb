class AddIdexToUserNameTrue < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :name
    add_column :foods, :name, :string
    add_index :foods, :name, unique: true
  end
end
