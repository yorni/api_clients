class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name, limit: 50
      t.integer :warehouse_key, limit: 4

      t.timestamps null: false
    end
  end
end
