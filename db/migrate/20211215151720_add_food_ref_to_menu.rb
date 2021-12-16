class AddFoodRefToMenu < ActiveRecord::Migration[6.0]
  def change
    add_reference :menus, :food
  end
end
