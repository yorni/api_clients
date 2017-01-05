class RenameColumnClientsMiddleNameToLastName < ActiveRecord::Migration
  def change
  	rename_column :clients, :middle_name, :last_name
  	rename_column :main_systems, :period, :time_stamp
  	
  end
end
