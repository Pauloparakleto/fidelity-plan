class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
