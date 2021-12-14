class AddIdexToUserName < ActiveRecord::Migration[6.0]
  def change
    add_index :foods, :name
  end
end
