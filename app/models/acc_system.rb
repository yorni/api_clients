class AccSystem < ActiveRecord::Base
  has_many :client_contact_syncs
  has_many :client_document_syncs
  has_many :person_syncs
  has_many :api_keys
  has_many :client_syncs
  has_many :acc_system_checkpoints
end
