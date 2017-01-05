class AccSystemsController < ApplicationController
  before_action :set_acc_system, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /acc_systems
  # GET /acc_systems.json
  def index
    @acc_systems = AccSystem.paginate(:page => params[:offset], :per_page => 20)

    acc_systems_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @acc_systems_hash }
      format.xml { render :xml => @acc_systems_hash }
    end
  end

  # GET /acc_systems/1
  # GET /acc_systems/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @acc_system_hash }
      format.xml { render :xml => @acc_system_hash }
    end
  end

  # GET /acc_systems/new
  def new
    @acc_system = AccSystem.new
  end

  # GET /acc_systems/1/edit
  def edit
  end

  # POST /acc_systems
  # POST /acc_systems.json
  def create
    @acc_system = AccSystem.new(acc_system_params)

    respond_to do |format|
      if @acc_system.save
        acc_system_hash()
        format.html { redirect_to @acc_system, notice: $gcMsgAppendRecord }
        format.json { render :json => @acc_system_hash }
        format.xml { render :xml => @acc_system_hash }
      else
        lcHashError = { return_status: false, errors: @acc_system.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /acc_systems/1
  # PATCH/PUT /acc_systems/1.json
  def update
    respond_to do |format|
      if @acc_system.update(acc_system_params)
        acc_system_hash()
        format.html { redirect_to @acc_system, notice: $gcMsgUpdateRecord }
        format.json { render :json => @acc_system_hash }
        format.xml { render :xml => @acc_system_hash }
      else
        lcHashError = { return_status: false, errors: @acc_system.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /acc_systems/1
  # DELETE /acc_systems/1.json
  def destroy
    respond_to do |format|
      unless @acc_system.nil?
        acc_system_hash()
        @acc_system.destroy
        format.html { redirect_to acc_systems_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @acc_system_hash }
        format.xml { render :xml => @acc_system_hash }
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
    def set_acc_system
      @acc_system = AccSystem.where(id: params[:id]).first
      acc_system_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_system_params
      params.require(:acc_system).permit(:name)
    end

    def acc_system_hash
      if !@acc_system.blank? then
        @acc_system_hash = { return_status: true, acc_system: @acc_system }
      else
        @acc_system_hash = { return_status: false }
      end
    end

    def acc_systems_hash
      if !@acc_systems.blank? then
        @acc_systems_hash = { return_status: true, acc_systems: @acc_systems }
      else
        @acc_systems_hash = { return_status: false }
      end
    end
end
