class RemoveFieldNewClientFromClientSyncs < ActiveRecord::Migration
  def change
    remove_column :client_syncs, :new_client
  end
end
