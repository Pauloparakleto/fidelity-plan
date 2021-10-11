class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :phone_confirmation
      t.string :email
      t.string :cpf

      t.timestamps
    end
  end
end
