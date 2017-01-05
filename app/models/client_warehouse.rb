class ClientWarehouse < ActiveRecord::Base
  belongs_to :client
  belongs_to :warehouse
end
