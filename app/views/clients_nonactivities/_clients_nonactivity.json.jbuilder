json.extract! clients_nonactivity, :id, :client_id, :acc_system_id, :created_at, :updated_at
json.url clients_nonactivity_url(clients_nonactivity, format: :json)