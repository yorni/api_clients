class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key, limit: 100
      t.string :name, limit: 100
      t.belongs_to :acc_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
