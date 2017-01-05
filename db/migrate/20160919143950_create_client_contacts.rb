class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
