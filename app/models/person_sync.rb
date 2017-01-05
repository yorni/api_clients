class PersonSync < ActiveRecord::Base
  belongs_to :person
  belongs_to :acc_system
end
