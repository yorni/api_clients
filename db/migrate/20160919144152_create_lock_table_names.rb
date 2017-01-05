class CreateLockTableNames < ActiveRecord::Migration
  def change
    create_table :lock_table_names do |t|
      t.string :name, limit: 30

      t.timestamps null: false
    end
  end
end
