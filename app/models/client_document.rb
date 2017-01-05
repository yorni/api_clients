class ClientDocument < ActiveRecord::Base
  belongs_to :doc_type
  belongs_to :client
  has_many :client_document_syncs
  after_save :update_save_data
  
  private
    def update_save_data
      @clientdocument = ClientDocumentSync.new
      @clientdocument.client_document_id = id
      @clientdocument.acc_system_id = $acc_system_id
      @clientdocument.time_stamp = Time.now
      @clientdocument.save
    end
end
