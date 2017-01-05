class AddAccSystemToClientDocumentSyncs < ActiveRecord::Migration
  def change
    add_reference :client_document_syncs, :acc_system, index: true, foreign_key: true
  end
end
