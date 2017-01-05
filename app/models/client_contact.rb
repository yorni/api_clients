class ClientContact < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
  has_many :client_contact_syncs
  after_save :update_save_data
  
  private
    def update_save_data
      @client_contact_sync = ClientContactSync.new
      @client_contact_sync.client_contact_id = id
      @client_contact_sync.acc_system_id = $acc_system_id
      @client_contact_sync.time_stamp = Time.now
      @client_contact_sync.save
    end 
end
