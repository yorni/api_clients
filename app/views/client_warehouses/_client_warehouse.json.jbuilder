json.extract! client_warehouse, :id, :client_id, :warehouse_id, :created_at, :updated_at
json.url client_warehouse_url(client_warehouse, format: :json)