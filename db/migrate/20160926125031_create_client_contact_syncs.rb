class CreateClientContactSyncs < ActiveRecord::Migration
  def change
    create_table :client_contact_syncs do |t|
      t.belongs_to :client_contact, index: true, foreign_key: true
      t.datetime :time_stamp

      t.timestamps null: false
    end
  end
end
