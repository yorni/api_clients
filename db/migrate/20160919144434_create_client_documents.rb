class CreateClientDocuments < ActiveRecord::Migration
  def change
    create_table :client_documents do |t|
      t.belongs_to :doc_type, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.string :doc_serial, limit: 20
      t.string :doc_number, limit: 20

      t.timestamps null: false
    end
  end
end
