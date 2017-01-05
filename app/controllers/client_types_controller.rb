class ClientTypesController < ApplicationController
  before_action :set_client_type, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_types
  # GET /client_types.json
  def index
    @client_types = ClientType.paginate(:page => params[:offset], :per_page => 20)

    client_types_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_types_hash }
      format.xml { render :xml => @client_types_hash }
    end
  end

  # GET /client_types/1
  # GET /client_types/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_type_hash }
      format.xml { render :xml => @client_type_hash }
    end
  end

  # GET /client_types/new
  def new
    @client_type = ClientType.new
  end

  # GET /client_types/1/edit
  def edit
  end

  # POST /client_types
  # POST /client_types.json
  def create
    @client_type = ClientType.new(client_type_params)

    respond_to do |format|
      if @client_type.save
        client_type_hash()
        format.html { redirect_to @client_type, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_type_hash }
        format.xml { render :xml => @client_type_hash }
      else
        lcHashError = { return_status: false, errors: @client_type.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_types/1
  # PATCH/PUT /client_types/1.json
  def update
    respond_to do |format|
      if @client_type.update(client_type_params)
        acc_system_hash()
        format.html { redirect_to @client_type, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_type_hash }
        format.xml { render :xml => @client_type_hash }
      else
        lcHashError = { return_status: false, errors: @client_type.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_types/1
  # DELETE /client_types/1.json
  def destroy
    respond_to do |format|
      unless @client_type.nil?
        client_type_hash()
        @client_type.destroy
        format.html { redirect_to client_types_url, $gcMsgDeleteRecord }
        format.json { render :json => @client_type_hash }
        format.xml { render :xml => @client_type_hash }
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
    def set_client_type
      @client_type = ClientType.where(id: params[:id]).first
      client_type_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_type_params
      params.require(:client_type).permit(:name)
    end

    def acc_system_hash
      if !@client_type.blank? then
        @client_type_hash = { return_status: true, client_type: @client_type }
      else
        @client_type_hash = { return_status: false }
      end
    end

    def client_types_hash
      if !@client_types.blank? then
        @client_types_hash = { return_status: true, client_types: @client_types }
      else
        @client_types_hash = { return_status: false }
      end
    end
end
