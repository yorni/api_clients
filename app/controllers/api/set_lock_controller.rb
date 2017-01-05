class Api::SetLockController < ApplicationController

	def show
		client_id = params[:id]
		if Client.exists?(client_id)
			unless Lock.exists?(client_id: client_id)
				lock = Lock.new
				lock.acc_system_id = $acc_system_id
				lock.time_stamp = Time.now
				lock.client_id = client_id
				lock.save
				result = { return_status: true, message: 'success'} 
			else
				result = { return_status: false, message: 'client already locked'} 
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