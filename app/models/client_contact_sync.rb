class ClientContactSync < ActiveRecord::Base
  belongs_to :client_contact
  belongs_to :acc_system
end
