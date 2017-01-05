class ClientWarehousesController < ApplicationController
  before_action :set_client_warehouse, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}
  # GET /client_warehouses
  # GET /client_warehouses.json
  def index
    @client_warehouses = ClientWarehouse.paginate(:page => params[:offset], :per_page => 20)

    client_warehouses_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_warehouses_hash }
      format.xml { render :xml => @client_warehouses_hash }
    end
  end

  # GET /client_warehouses/1
  # GET /client_warehouses/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_warehouse_hash }
      format.xml { render :xml => @client_warehouse_hash }
    end
  end

  # GET /client_warehouses/new
  def new
    @client_warehouse = ClientWarehouse.new
  end

  # GET /client_warehouses/1/edit
  def edit
  end

  # POST /client_warehouses
  # POST /client_warehouses.json
  def create
    @client_warehouse = ClientWarehouse.new(client_warehouse_params)

    respond_to do |format|
      if @client_warehouse.save
        client_warehouse_hash()
        format.html { redirect_to @client_warehouse, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_warehouse_hash }
        format.xml { render :xml => @client_warehouse_hash }
      else
        lcHashError = { return_status: false, errors: @client_warehouse.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_warehouses/1
  # PATCH/PUT /client_warehouses/1.json
  def update
    respond_to do |format|
      if @client_warehouse.update(client_warehouse_params)
        client_warehouse_hash()
        format.html { redirect_to @client_warehouse, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_warehouse_hash }
        format.xml { render :xml => @client_warehouse_hash }
      else
        lcHashError = { return_status: false, errors: @client_warehouse.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_warehouses/1
  # DELETE /client_warehouses/1.json
  def destroy
    respond_to do |format|
      unless @client_warehouse.nil?
        client_warehouse_hash()
        @client_warehouse.destroy
        format.html { redirect_to client_warehouses_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_warehouse_hash }
        format.xml { render :xml => @client_warehouse_hash }
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
    def set_client_warehouse
      @client_warehouse = ClientWarehouse.where(id: params[:id]).first
      client_warehouse_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_warehouse_params
      params.require(:client_warehouse).permit(:client_id, :warehouse_id)
    end

    def client_warehouse_hash
      if !@client_warehouse.blank? then
        @client_warehouse_hash = { return_status: true, client_warehouse: @client_warehouse.as_json(include: { client: { include: :client_type } , warehouse: {} } ) }
      else
        @client_warehouse_hash = { return_status: false }
      end
    end

    def client_warehouses_hash
      if !@client_warehouses.blank? then
        @client_warehouses_hash = { return_status: true, client_warehouses: @client_warehouses.as_json(include: { client: { include: :client_type } , warehouse: {} } ) }
      else
        @client_warehouses_hash = { return_status: false }
      end
    end
end
