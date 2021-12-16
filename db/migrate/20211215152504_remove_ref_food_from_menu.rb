class RemoveRefFoodFromMenu < ActiveRecord::Migration[6.0]
  def change
    remove_reference :menus, :food
  end
end
