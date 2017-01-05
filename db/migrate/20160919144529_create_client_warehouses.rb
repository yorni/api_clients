class CreateClientWarehouses < ActiveRecord::Migration
  def change
    create_table :client_warehouses do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
