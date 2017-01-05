class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.belongs_to :acc_system, index: true, foreign_key: true
      t.datetime :time_stamp
      t.belongs_to :lock_table_name, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
