class ApiKeysController < ApplicationController
  before_action :set_api_key, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /api_keys
  # GET /api_keys.json
  def index
    @api_keys = ApiKey.paginate(:page => params[:offset], :per_page => 20)

    api_keys_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @api_keys_hash }
      format.xml { render :xml => @api_keys_hash }
    end
  end

  # GET /api_keys/1
  # GET /api_keys/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @api_key_hash }
      format.xml { render :xml => @api_key_hash }
    end
  end

  # GET /api_keys/new
  def new
    @api_key = ApiKey.new
  end

  # GET /api_keys/1/edit
  def edit
  end

  # POST /api_keys
  # POST /api_keys.json
  def create
    @api_key = ApiKey.new(api_key_params)

    respond_to do |format|
      if @api_key.save
        api_key_hash()
        format.html { redirect_to @api_key, notice: $gcMsgAppendRecord }
        format.json { render :json => @api_key_hash }
        format.xml { render :xml => @api_key_hash }
      else
        lcHashError = { return_status: false, errors: @api_key.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /api_keys/1
  # PATCH/PUT /api_keys/1.json
  def update
    respond_to do |format|
      if @api_key.update(api_key_params)
        api_key_hash()
        format.html { redirect_to @api_key, notice: $gcMsgUpdateRecord }
        format.json { render :json => @api_key_hash }
        format.xml { render :xml => @api_key_hash }
      else
        lcHashError = { return_status: false, errors: @api_key.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.json
  def destroy
    respond_to do |format|
      unless @api_key.nil?
        api_key_hash()
        @api_key.destroy
        format.html { redirect_to api_keys_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @api_key_hash }
        format.xml { render :xml => @api_key_hash }
      else
        lcHashError = { return_status: false }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = ApiKey.where(id: params[:id]).first
      api_key_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_key_params
      params.require(:api_key).permit(:key, :name, :acc_system_id)
    end

    def api_key_hash
      if !@api_key.blank? then
        @api_key_hash = { return_status: true, api_key: @api_key.as_json(include: :acc_system ) }
      else
        @api_key_hash = { return_status: false }
      end
    end

    def api_keys_hash
      if !@api_keys.blank? then
        @api_keys_hash = { return_status: true, api_keys: @api_keys.as_json(include: :acc_system ) }
      else
        @api_keys_hash = { return_status: false }
      end
    end
end
