class RemoveCustomerNamefromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :customer_name
  end
end
