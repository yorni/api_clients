json.extract! client_contact, :id, :person_id, :client_id, :created_at, :updated_at
json.url client_contact_url(client_contact, format: :json)