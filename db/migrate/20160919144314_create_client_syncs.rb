class CreateClientSyncs < ActiveRecord::Migration
  def change
    create_table :client_syncs do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :acc_system, index: true, foreign_key: true
      t.boolean :new_client
      t.datetime :time_stamp

      t.timestamps null: false
    end
  end
end
