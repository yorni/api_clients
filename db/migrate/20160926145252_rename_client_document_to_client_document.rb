class RenameClientDocumentToClientDocument < ActiveRecord::Migration
  def change
  	rename_column :client_document_syncs, :Client_document_id, :client_document_id
  	#rename_index :client_document_syncs, :Client_document_id, :client_document_id
  end
end
