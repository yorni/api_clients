class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /warehouses
  # GET /warehouses.json
  def index
    @warehouses = Warehouse.paginate(:page => params[:offset], :per_page => 20)

    warehouses_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @warehouses_hash }
      format.xml { render :xml => @warehouses_hash }
    end
  end

  # GET /warehouses/1
  # GET /warehouses/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @warehouse_hash }
      format.xml { render :xml => @warehouse_hash }
    end
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses
  # POST /warehouses.json
  def create
    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        warehouse_hash()
        format.html { redirect_to @warehouse, notice: $gcMsgAppendRecord }
        format.json { render :json => @warehouse_hash }
        format.xml { render :xml => @warehouse_hash }
      else
        lcHashError = { return_status: false, errors: @warehouse.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /warehouses/1
  # PATCH/PUT /warehouses/1.json
  def update
    respond_to do |format|
      if @warehouse.update(warehouse_params)
        acc_system_hash()
        format.html { redirect_to @warehouse, notice: $gcMsgUpdateRecord }
        format.json { render :json => @warehouse_hash }
        format.xml { render :xml => @warehouse_hash }
      else
        lcHashError = { return_status: false, errors: @warehouse.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  def destroy
    respond_to do |format|
      unless @warehouse.nil?
        warehouse_hash()
        @warehouse.destroy
        format.html { redirect_to warehouses_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @warehouse_hash }
        format.xml { render :xml => @warehouse_hash }
      else
        lcHashError = { return_status: false }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  private
    def set_warehouse
      @warehouse = Warehouse.where(id: params[:id]).first
      warehouse_hash()
    end

    def warehouse_params
      params.require(:warehouse).permit(:name, :warehouse_key)
    end

    def warehouse_hash
      if !@warehouse.blank? then
        @warehouse_hash = { return_status: true, warehouse: @warehouse }
      else
        @warehouse_hash = { return_status: false }
      end
    end

    def warehouses_hash
      if !@warehouses.blank? then
        @warehouses_hash = { return_status: true, warehouses: @warehouses }
      else
        @warehouses_hash = { return_status: false }
      end
    end

end
