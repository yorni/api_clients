class Api::GetSyncController < ApplicationController

	def index
		time_stamp_to = Time.now

		checkpoint = AccSystemCheckpoint.where(["acc_system_id = ?", $acc_system_id]).order('time_stamp DESC').first

		if checkpoint.blank? 
			time_stamp_from = Time.new(2000) 
		else
			time_stamp_from = checkpoint.time_stamp
		end
	sync_clients_table_json = ClientSync.where(["time_stamp >= ? and time_stamp <= ? and acc_system_id <> ?", time_stamp_from, time_stamp_to, $acc_system_id]).as_json( include: :client, :only => [:client_id, :acc_system_id, :time_stamp])
	
	sync_client_contacts_table_json = ClientContactSync.where(["time_stamp >= ? and time_stamp <= ? and acc_system_id <> ?", time_stamp_from, time_stamp_to, $acc_system_id]).as_json( include: :client_contact, :only => [:client_contact_id, :acc_system_id, :time_stamp])

	sync_client_documents_table_json = ClientDocumentSync.where(["time_stamp >= ? and time_stamp <= ? and acc_system_id <> ?", time_stamp_from, time_stamp_to, $acc_system_id]).as_json( include: :client_document, :only => [:client_document_id, :acc_system_id, :time_stamp])

	sync_person_table_json = PersonSync.where(["time_stamp >= ? and time_stamp <= ? and acc_system_id <> ?", time_stamp_from, time_stamp_to, $acc_system_id]).as_json( include: :person, :only => [:person_id, :acc_system_id, :time_stamp])

	result = { return_status: true, time_stamp: time_stamp_to, clients: sync_clients_table_json, client_contacts: sync_client_contacts_table_json, client_documents: sync_client_documents_table_json, people: sync_person_table_json} 
	
		respond_to do |format|
			format.html {render json: result}
			format.json {render json: result}
			format.xml {render xml: result }
		end
	end
end