class Api::GetclientController < ApplicationController

def index
  lcSearch = params[:search] 
  liCountSearch = lcSearch.size
  
  llReturn_status = true
  laClient = ""
  
  if liCountSearch == 10 
    lcWhere = "inn = '#{lcSearch}'"
  elsif liCountSearch == 8
    lcWhere = "okpo = '#{lcSearch}'"  
  elsif liCountSearch == 12
    lcWhere = "cellphone = '#{lcSearch}'"  
  else   
    llReturn_status = false
  end
    
  if llReturn_status == true 
    laClients = Client.all.where(lcWhere)

    if laClients.count > 0 then
      laClient_first = laClients.first
 
      laClient = 
        {
        id: laClient_first.id, 
        client_type_id: laClient_first.client_type_id, 
        name: laClient_first.name, 
        first_name: laClient_first.first_name, 
        second_name: laClient_first.second_name, 
        last_name: laClient_first.last_name, 
        cellphone: laClient_first.cellphone, 
        okpo: laClient_first.okpo, 
        inn: laClient_first.inn, 
        contacts: laClient_first.client_contacts.as_json(include: { person: { :only => [:name, :cellphone] } }, :only => []),
        documents: laClient_first.client_documents.as_json(include: { doc_type: { :only => [:id, :name] } }, :only => [:id, :doc_serial, :doc_number])
        }    
      
    else
      llReturn_status = false
    end  
  end
  
  result = { return_status: llReturn_status, client: laClient }

  respond_to do |format|
    format.html {render json: result}
    format.json {render json: result}
    format.xml {render xml: result }
  end

end


end 