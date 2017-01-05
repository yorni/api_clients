class ClientSyncsController < ApplicationController
  before_action :set_client_sync, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_syncs
  # GET /client_syncs.json
  def index
    @client_syncs = ClientSync.paginate(:page => params[:offset], :per_page => 20)

    client_syncs_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_syncs_hash }
      format.xml { render :xml => @client_syncs_hash }
    end
  end

  # GET /client_syncs/1
  # GET /client_syncs/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_sync_hash }
      format.xml { render :xml => @client_sync_hash }
    end
  end

  # GET /client_syncs/new
  def new
    @client_sync = ClientSync.new
  end

  # GET /client_syncs/1/edit
  def edit
  end

  # POST /client_syncs
  # POST /client_syncs.json
  def create
    @client_sync = ClientSync.new(client_sync_params)

    respond_to do |format|
      if @client_sync.save
        client_sync_hash()
        format.html { redirect_to @client_sync, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_sync_hash }
        format.xml { render :xml => @client_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_sync.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_syncs/1
  # PATCH/PUT /client_syncs/1.json
  def update
    respond_to do |format|
      if @client_sync.update(client_sync_params)
        client_sync_hash()
        format.html { redirect_to @client_sync, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_sync_hash }
        format.xml { render :xml => @client_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_sync.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_syncs/1
  # DELETE /client_syncs/1.json
  def destroy
    respond_to do |format|
      unless @client_sync.nil?
        client_sync_hash()
        @client_sync.destroy
        format.html { redirect_to client_syncs_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_sync_hash }
        format.xml { render :xml => @client_sync_hash }
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
    def set_client_sync
      @client_sync = ClientSync.where(id: params[:id]).first
      client_sync_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_sync_params
      params.require(:client_sync).permit(:client_id, :acc_system_id, :time_stamp)
    end

    def client_sync_hash
      if !@client_sync.blank? then
        @client_sync_hash = { return_status: true, client_sync: @client_sync.as_json(include: { client: { include: :client_type } , acc_system: {} } ) }
      else
        @client_contact_hash = { return_status: false }
      end
    end

    def client_syncs_hash
      if !@client_syncs.blank? then
        @client_syncs_hash = { return_status: true, client_syncs: @client_syncs.as_json(include: { client: { include: :client_type } , acc_system: {} } ) }
      else
        @client_syncs_hash = { return_status: false }
      end
    end
end
