class ClientDocumentSyncsController < ApplicationController
  before_action :set_client_document_sync, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_document_syncs
  # GET /client_document_syncs.json
  def index
    @client_document_syncs = ClientDocumentSync.paginate(:page => params[:offset], :per_page => 20)

    client_document_syncs_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_document_syncs_hash }
      format.xml { render :xml => @client_document_syncs_hash }
    end
  end

  # GET /client_document_syncs/1
  # GET /client_document_syncs/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_document_sync_hash }
      format.xml { render :xml => @client_document_sync_hash }
    end
  end

  # GET /client_document_syncs/new
  def new
    @client_document_sync = ClientDocumentSync.new
  end

  # GET /client_document_syncs/1/edit
  def edit
  end

  # POST /client_document_syncs
  # POST /client_document_syncs.json
  def create
    @client_document_sync = ClientDocumentSync.new(client_document_sync_params)

    respond_to do |format|
      if @client_document_sync.save
        client_document_sync_hash()
        format.html { redirect_to @client_document_sync, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_document_sync_hash }
        format.xml { render :xml => @client_document_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_document_sync.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_document_syncs/1
  # PATCH/PUT /client_document_syncs/1.json
  def update
    respond_to do |format|
      if @client_document_sync.update(client_document_sync_params)
        client_document_sync_hash()
        format.html { redirect_to @client_document_sync, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_document_sync_hash }
        format.xml { render :xml => @client_document_sync_hash }
      else
        lcHashError = { return_status: false, errors: @client_document_sync.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_document_syncs/1
  # DELETE /client_document_syncs/1.json
  def destroy
    respond_to do |format|
      unless @client_document_sync.nil?
        client_document_sync_hash()
        @client_document_sync.destroy
        format.html { redirect_to client_document_syncs_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_document_sync_hash }
        format.xml { render :xml => @client_document_sync_hash }
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
    def set_client_document_sync
      @client_document_sync = ClientDocumentSync.where(id: params[:id]).first
      client_document_sync_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_document_sync_params
      params.require(:client_document_sync).permit(:client_document_id, :time_stamp)
    end

    def  client_document_sync_hash
      if !@client_document_sync.blank? then
        @client_document_sync_hash = { return_status: true, client_document_sync: @client_document_sync.as_json(include: { client_document: { include: { client: { include: :client_type } , doc_type: {} }  }, acc_system: {} }  ) }
      else
        @client_document_sync_hash = { return_status: false }
      end
    end

    def client_document_syncs_hash
      if !@client_document_syncs.blank? then
        @client_document_syncs_hash = { return_status: true, clients: @client_document_syncs.as_json(include: { client_document: { include: { client: { include: :client_type } , doc_type: {} }  }, acc_system: {} }  ) }
      else
        @client_document_syncs_hash = { return_status: false }
      end
    end
end
