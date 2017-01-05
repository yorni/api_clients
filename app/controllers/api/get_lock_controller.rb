class Api::GetLockController < ApplicationController
	def show
		client_id = params[:id]

		if Client.exists?(client_id)
			unless Lock.exists?(client_id: client_id)
				result = { return_status: true, message: 'client unlocked'} 
			else
				result = { return_status: false, message: 'client locked'} 
			end
		else
			result = { return_status: false, message: 'client not fount'} 
		end

		

		respond_to do |format|
			format.html {render json: result}
			format.json {render json: result}
			format.xml {render xml: result }
		end
	end
end
