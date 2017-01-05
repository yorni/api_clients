class Api::GetpersonController < ApplicationController

def index
  lcSearch = params[:search] 
  liCountSearch = lcSearch.size
  
  llReturn_status = true
  laPerson = ""
  
  if liCountSearch == 10 
    lcWhere = "inn = '#{lcSearch}'"
  elsif liCountSearch == 12
    lcWhere = "cellphone = '#{lcSearch}'"  
  else   
    llReturn_status = false
  end
    
  if llReturn_status == true 
    laPeople = Person.all.where(lcWhere)

    if laPeople.count > 0 then
      laPerson_first = laPeople.first
 
      laPerson =
        {
        id: laPerson_first.id,
        name: laPerson_first.name,
        first_name: laPerson_first.first_name,
        second_name: laPerson_first.second_name,
        last_name: laPerson_first.last_name,
        cellphone: laPerson_first.cellphone,
        inn: laPerson_first.inn,
        contacts: laPerson_first.client_contacts.as_json(include: { client: { include: { client_documents: {include: :doc_type} }  } })
        }
      
    else
      llReturn_status = false
    end  
  end
  
  result = { return_status: llReturn_status, person: laPerson }

  respond_to do |format|
    format.html {render json: result}
    format.json {render json: result}
    format.xml {render xml: result }
  end

end


end 