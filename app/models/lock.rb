class Lock < ActiveRecord::Base
  belongs_to :acc_system
  belongs_to :client
end
