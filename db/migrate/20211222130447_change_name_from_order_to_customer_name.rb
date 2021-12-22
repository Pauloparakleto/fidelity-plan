class ChangeNameFromOrderToCustomerName < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :name
    add_column :orders, :customer_name, :string
  end
end
