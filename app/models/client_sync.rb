class ClientSync < ActiveRecord::Base
  belongs_to :client
  belongs_to :acc_system
end
