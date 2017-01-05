class CreateClientDocumentSyncs < ActiveRecord::Migration
  def change
    create_table :client_document_syncs do |t|
      t.belongs_to :Client_document, index: true, foreign_key: true
      t.datetime :time_stamp

      t.timestamps null: false
    end
  end
end
