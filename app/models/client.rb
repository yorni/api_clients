class Client < ActiveRecord::Base
  belongs_to :client_type
  has_many :client_contacts, dependent: :destroy
  has_many :client_warehouses, dependent: :destroy
  has_many :client_documents, dependent: :destroy
  after_save :update_save_data
  has_many :client_syncs, dependent: :destroy
  
  private
    def update_save_data
      @clientsync = ClientSync.new
      @clientsync.client_id = id
      @clientsync.acc_system_id = $acc_system_id
      @clientsync.time_stamp = Time.now
      @clientsync.save
    end  
end
