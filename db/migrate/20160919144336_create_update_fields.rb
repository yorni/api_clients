class CreateUpdateFields < ActiveRecord::Migration
  def change
    create_table :update_fields do |t|
      t.string :name, limit: 30
      t.string :value, limit: 150
      t.belongs_to :client_sync, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
