class DropUpdateFields < ActiveRecord::Migration
  def change
  	drop_table :update_fields
  end
end
