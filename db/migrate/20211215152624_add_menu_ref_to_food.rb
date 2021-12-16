class AddMenuRefToFood < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :menu
  end
end
