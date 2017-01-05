class ClientDocumentSync < ActiveRecord::Base
  belongs_to :client_document
  belongs_to :acc_system
end
