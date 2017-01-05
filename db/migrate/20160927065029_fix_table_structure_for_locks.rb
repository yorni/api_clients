class FixTableStructureForLocks < ActiveRecord::Migration
  def change
  	remove_column :locks, :lock_table_name_id
  	drop_table :lock_table_names
  	add_reference :locks, :client, index: true, foreign_key: true
  end
end
