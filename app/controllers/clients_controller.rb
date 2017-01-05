class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.paginate(:page => params[:offset], :per_page => 20)

    clients_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @clients_hash }
      format.xml { render :xml => @clients_hash }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_hash }
      format.xml { render :xml => @client_hash }
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        client_hash()
        format.html { redirect_to @client, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_hash }
        format.xml { render :xml => @client_hash }
      else
        lcHashError = { return_status: false, errors: @client.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        client_hash()
        format.html { redirect_to @client, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_hash }
        format.xml { render :xml => @client_hash }
      else
        lcHashError = { return_status: false, errors: @client.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
   respond_to do |format|
     unless @client.nil?
        client_hash()
        @client.destroy
        format.html { redirect_to clients_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_hash }
        format.xml { render :xml => @client_hash }
      else
        lcHashError = { return_status: false }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  private
    def set_client
      @client = Client.where(id: params[:id]).first
      client_hash()
    end

    def client_params
      params.require(:client).permit(:name, :first_name, :second_name, :last_name, :cellphone, :okpo, :inn, :client_type_id)
    end

    def client_hash
      if !@client.blank? then
        @client_hash = { return_status: true, client: @client.as_json(include: :client_warehouse, include: {client_warehouses: {include: :warehouse}, client_contacts: {include: :person}, client_documents: {include: :doc_type} } ) }
      else
        @client_hash = { return_status: false }
      end
    end

    def clients_hash
      if !@clients.blank? then
        @clients_hash = { return_status: true, clients: @clients.as_json(include: :client_warehouse, include: {client_warehouses: {include: :warehouse}, client_contacts: {include: :person}, client_documents: {include: :doc_type} } ) }
      else
        @clients_hash = { return_status: false }
      end
    end
end
