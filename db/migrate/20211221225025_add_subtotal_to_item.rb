class AddSubtotalToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :subtotal, :float
  end
end
