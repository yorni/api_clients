class AddAccSystemToClientContactSyncs < ActiveRecord::Migration
  def change
    add_reference :client_contact_syncs, :acc_system, index: true, foreign_key: true
  end
end
