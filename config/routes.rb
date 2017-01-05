Rails.application.routes.draw do
  resources :acc_system_checkpoints
  resources :api_keys
  resources :clients, path: '/api/clients'
  resources :clients_nonactivities, path: '/api/clients_nonactivities'  
  resources :client_types, path: '/api/client_types'
  resources :client_contacts, path: '/api/client_contacts'
  resources :people, path: '/api/people'
  resources :client_documents, path: '/api/client_documents'
  resources :doc_types, path: '/api/doc_types'
  resources :client_warehouses, path: '/api/client_warehouses'
  resources :warehouses, path: '/api/warehouses'

  resources :acc_systems, path: '/api/acc_systems'
  resources :acc_system_references, path: '/api/acc_system_references'
  resources :main_systems, path: '/api/main_systems'
  resources :locks, path: '/api/locks'
  resources :lock_table_names, path: '/api/lock_table_names'

  resources :client_syncs, path: '/api/client_syncs'
  resources :client_document_syncs, path: '/api/client_document_syncs'
  resources :person_syncs, path: '/api/person_syncs'
  resources :client_contact_syncs, path: '/api/client_contact_syncs'
  
  namespace :api do
    resources :getclient, path: '/get_client'
    resources :getperson, path: '/get_person'
    resources :set_lock
    resources :get_lock
    resources :get_sync
    resources :unlock
    resources :confirm_sync
  end 

  root "clients#index"
end
