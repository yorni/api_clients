class DocType < ActiveRecord::Base
  has_many :client_documents
end
