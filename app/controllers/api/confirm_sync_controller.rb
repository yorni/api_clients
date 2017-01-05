class Api::ConfirmSyncController < ApplicationController
	def index
		time_stamp = params[:time_stamp]
		

		acc_sys_checkpoint = AccSystemCheckpoint.new
		acc_sys_checkpoint.acc_system_id = $acc_system_id
		acc_sys_checkpoint.time_stamp = time_stamp
		acc_sys_checkpoint.save
		result = { return_status: true, message: 'checkpoint saved'} 



		respond_to do |format|
			format.html {render json: result}
			format.json {render json: result}
			format.xml {render xml: result }
		end
	end
end
