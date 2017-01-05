class ClientContactSyncsController < ApplicationController
  before_action :set_client_contact_sync, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_contact_syncs
  # GET /client_contact_syncs.json
  def index
    @client_contact_syncs = ClientContactSync.paginate(:page => params[:offset], :per_page => 20)

    client_contact_syncs_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_contact_syncs_hash }
      format.xml { render :xml => @client_contact_syncs_hash }
    end
  end

  # GET /client_contact_syncs/1
  # GET /client_contact_syncs/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_contact_sync_hash }
      format.xml { render :xml => @client_contact_sync_hash }
    end
  end

  # GET /client_contact_syncs/new
  def new
    @client_contact_sync = ClientContactSync.new
  end

  # GET /client_contact_syncs/1/edit
  def edit
  end

  # POST /client_contact_syncs
  # POST /client_contact_syncs.json
  def create
    @client_contact_sync = ClientContactSync.new(client_contact_sync_params)

    respond_to do |format|
      if @client_contact_sync.save
        client_contact_sync_hash()
        format.html { redirect_to @client_contact_sync, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_contact_sync_hash }
        format.xml { render :xml => @client_contact_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_contact_sync.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_contact_syncs/1
  # PATCH/PUT /client_contact_syncs/1.json
  def update
    respond_to do |format|
      if @client_contact_sync.update(client_contact_sync_params)
        client_contact_sync_hash()
        format.html { redirect_to @client_contact_sync, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_contact_sync_hash }
        format.xml { render :xml => @client_contact_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_contact_sync.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_contact_syncs/1
  # DELETE /client_contact_syncs/1.json
  def destroy
    respond_to do |format|
      unless @client_contact_sync.nil?
        client_contact_sync_hash()
        @client_contact_sync.destroy
        format.html { redirect_to client_contact_syncs_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_contact_sync_hash }
        format.xml { render :xml => @client_contact_sync_hash }
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
    def set_client_contact_sync
      @client_contact_sync = ClientContactSync.where(id: params[:id]).first
      client_contact_sync_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_contact_sync_params
      params.require(:client_contact_sync).permit(:client_contact_id, :acc_system_id, :time_stamp)
    end

    def client_contact_sync_hash
      if !@client_contact_sync.blank? then
        @client_contact_sync_hash = { return_status: true, client_contact_sync: @client_contact_sync.as_json(include: { client_contact: { include: { client: { include: :client_type } , person: {} } }, acc_system: {} } ) }
      else
        @client_contact_sync_hash = { return_status: false }
      end
    end

    def client_contact_syncs_hash
      if !@client_contact_syncs.blank? then
        @client_contact_syncs_hash = { return_status: true, client_contact_syncs: @client_contact_syncs.as_json(include: { client_contact: { include: { client: { include: :client_type } , person: {} } }, acc_system: {} } ) }
      else
        @client_contact_syncs_hash = { return_status: false }
      end
    end
end
