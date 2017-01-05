class ApplicationController < ActionController::Base
  before_action :set_session_vars
  http_basic_authenticate_with :name => "admin", :password => "admin", :if => Proc.new { |c| !(c.request.format == 'application/xml' || c.request.format == 'application/json')}

  #before_filter :restrict_access, :if => Proc.new { |c| c.request.format == 'application/json'} 
  #before_filter :reset_params, :if => Proc.new { |c| !(c.request.format == 'application/json')} 
  #before_action :set_session_vars
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_session_vars
  	$gcMsgAppendRecord = "Запись добавлена"
  	$gcMsgUpdateRecord = "Запись обновлена"
  	$gcMsgDeleteRecord = "Запись удалена"
    $gcHeaderShow = "Просмотр"
    $gcHeaderIndex = "Список"
    $gcHeaderEdit = "Редактирование"
    $gcHeaderNew = "Добавление"
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        begin
          $api_token = token
          $acc_system_id = ApiKey.find_by(key: $api_token).acc_system_id
          ApiKey.exists?(key: $api_token)
        end
      end
    end

    def reset_params
      $acc_system_id = 1002
    end
end
