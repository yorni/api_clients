json.extract! doc_type, :id, :name, :created_at, :updated_at
json.url doc_type_url(doc_type, format: :json)