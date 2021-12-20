class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.float :price
      t.integer :food_id
      t.integer :drink_id
      t.integer :order_id

      t.timestamps
    end
  end
end
