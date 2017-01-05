class CreateClientsNonactivities < ActiveRecord::Migration
  def change
    create_table :clients_nonactivities do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :acc_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
