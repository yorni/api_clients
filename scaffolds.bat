rails g scaffold ClientTypes name:string{30}

rails g scaffold Persons name:string{150} first_name:string{40}  second_name:string{40} last_name:string{40} cellphone:string{12} inn:string{10} 

rails g scaffold clients name:string{150} first_name:string{40} second_name:string{40} middle_name:string{40} cellphone:string{12} okpo:string{10} inn:string{10} client_type:belongs_to

rails g scaffold AccSystems name:string{30}

rails g scaffold Client_Contacts person:belongs_to client:belongs_to

rails g scaffold Clients_Nonactivity client:belongs_to acc_system:belongs_to

rails g scaffold MainSystems period:datetime acc_system:belongs_to

rails g scaffold LockTableNames name:string{30}

rails g scaffold Locks acc_system:belongs_to time_stamp:datetime lock_table_name:belongs_to  

rails g scaffold ClientSyncs client:belongs_to acc_system:belongs_to new_client:boolean time_stamp:datetime 

rails g scaffold UpdateFields name:string{30} value:string{150} client_sync:belongs_to

rails g scaffold DocTypes name:string{20}

rails g scaffold ClientDocuments doc_type:belongs_to client:belongs_to doc_serial:string{20} doc_number:string{20}

rails g scaffold Warehouses name:string{50} warehouse_key:integer{4}

rails g scaffold ClientWarehouses client:belongs_to warehouse:belongs_to
