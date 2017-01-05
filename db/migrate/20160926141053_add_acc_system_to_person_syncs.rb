class AddAccSystemToPersonSyncs < ActiveRecord::Migration
  def change
    add_reference :person_syncs, :acc_system, index: true, foreign_key: true
  end
end
