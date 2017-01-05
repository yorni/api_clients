class DropaccSystemReferencesTable < ActiveRecord::Migration
  def change
  	drop_table :acc_system_references
  end
end
