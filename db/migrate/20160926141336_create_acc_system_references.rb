class CreateAccSystemReferences < ActiveRecord::Migration
  def change
    create_table :acc_system_references do |t|
      t.belongs_to :acc_system, index: true, foreign_key: true
      t.datetime :time_stamp

      t.timestamps null: false
    end
  end
end
