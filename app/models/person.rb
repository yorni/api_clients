class Person < ActiveRecord::Base
  has_many :client_contacts 
  has_many :person_syncs
  after_save :update_save_data
  
  private
    def update_save_data
      @personsync = PersonSync.new
      @personsync.person_id = id
      @personsync.acc_system_id = $acc_system_id
      @personsync.time_stamp = Time.now
      @personsync.save
    end  
end
