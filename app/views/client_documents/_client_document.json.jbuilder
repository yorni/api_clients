json.extract! client_document, :id, :doc_type_id, :client_id, :doc_serial, :doc_number, :created_at, :updated_at
json.url client_document_url(client_document, format: :json)