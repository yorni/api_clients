class ClientsNonactivitiesController < ApplicationController
  before_action :set_clients_nonactivity, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /clients_nonactivities
  # GET /clients_nonactivities.json
  def index
    @clients_nonactivities = ClientsNonactivity.paginate(:page => params[:offset], :per_page => 20)

    clients_nonactivities_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @clients_nonactivities_hash }
      format.xml { render :xml => @clients_nonactivities_hash }
    end
  end

  # GET /clients_nonactivities/1
  # GET /clients_nonactivities/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @clients_nonactivity_hash }
      format.xml { render :xml => @clients_nonactivity_hash }
    end
  end

  # GET /clients_nonactivities/new
  def new
    @clients_nonactivity = ClientsNonactivity.new
  end

  # GET /clients_nonactivities/1/edit
  def edit
  end

  # POST /clients_nonactivities
  # POST /clients_nonactivities.json
  def create
    @clients_nonactivity = ClientsNonactivity.new(clients_nonactivity_params)

    respond_to do |format|
      if @clients_nonactivity.save
        clients_nonactivity_hash()
        format.html { redirect_to @clients_nonactivity, notice: $gcMsgAppendRecord }
        format.json { render :json => @clients_nonactivity_hash }
        format.xml { render :xml => @clients_nonactivity_hash }
      else
        lcHashError = { return_status: false, errors: @clients_nonactivity.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /clients_nonactivities/1
  # PATCH/PUT /clients_nonactivities/1.json
  def update
    respond_to do |format|
      if @clients_nonactivity.update(clients_nonactivity_params)
        clients_nonactivity_hash()
        format.html { redirect_to @clients_nonactivity, notice: $gcMsgAppendRecord }
        format.json { render :json => @clients_nonactivity_hash }
        format.xml { render :xml => @clients_nonactivity_hash }
      else
        lcHashError = { return_status: false, errors: @clients_nonactivity.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /clients_nonactivities/1
  # DELETE /clients_nonactivities/1.json
  def destroy
    respond_to do |format|
      unless @clients_nonactivity.nil?
        clients_nonactivity_hash()
        @clients_nonactivity.destroy
        format.html { redirect_to clients_nonactivities_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @clients_nonactivity_hash }
        format.xml { render :xml => @clients_nonactivity_hash }
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
    def set_clients_nonactivity
      @clients_nonactivity = ClientsNonactivity.where(id: params[:id]).first
      clients_nonactivity_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clients_nonactivity_params
      params.require(:clients_nonactivity).permit(:client_id, :acc_system_id)
    end

    def clients_nonactivity_hash
      if !@clients_nonactivity.blank? then
        @clients_nonactivity_hash = { return_status: true, clients_nonactivity: @clients_nonactivity.as_json(include: { client: { include: :client_type } , acc_system: {} } ) }
      else
        @clients_nonactivity_hash = { return_status: false }
      end
    end

    def clients_nonactivities_hash
      if !@clients_nonactivities.blank? then
        @clients_nonactivities_hash = { return_status: true, clients_nonactivities: @clients_nonactivities.as_json(include: { client: { include: :client_type } , acc_system: {} } ) }
      else
        @clients_nonactivities_hash = { return_status: false }
      end
    end
end
