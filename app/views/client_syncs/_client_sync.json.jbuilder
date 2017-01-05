json.extract! client_sync, :id, :client_id, :acc_system_id, :time_stamp, :created_at, :updated_at
json.url client_sync_url(client_sync, format: :json)