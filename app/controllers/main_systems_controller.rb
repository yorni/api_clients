class MainSystemsController < ApplicationController
  before_action :set_main_system, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /main_systems
  # GET /main_systems.json
  def index
    @main_systems = MainSystem.paginate(:page => params[:offset], :per_page => 20)

    main_systems_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @main_systems_hash }
      format.xml { render :xml => @main_systems_hash }
    end
  end

  # GET /main_systems/1
  # GET /main_systems/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @main_system_hash }
      format.xml { render :xml => @main_system_hash }
    end
  end

  # GET /main_systems/new
  def new
    @main_system = MainSystem.new
  end

  # GET /main_systems/1/edit
  def edit
  end

  # POST /main_systems
  # POST /main_systems.json
  def create
    @main_system = MainSystem.new(main_system_params)

    respond_to do |format|
      if @main_system.save
        main_system_hash()
        format.html { redirect_to @main_system, notice: $gcMsgAppendRecord }
        format.json { render :json => @main_system_hash }
        format.xml { render :xml => @main_system_hash }
      else
        lcHashError = { return_status: false, errors: @main_system.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /main_systems/1
  # PATCH/PUT /main_systems/1.json
  def update
    respond_to do |format|
      if @main_system.update(main_system_params)
        main_system_hash()
        format.html { redirect_to @main_system, notice: $gcMsgUpdateRecord }
        format.json { render :json => @main_system_hash }
        format.xml { render :xml => @main_system_hash }
      else
        lcHashError = { return_status: false, errors: @main_system.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /main_systems/1
  # DELETE /main_systems/1.json
  def destroy
    respond_to do |format|
      unless @main_system.nil?
        main_system._hash()
        @main_system.destroy
        format.html { redirect_to main_systems_url,  notice: $gcMsgDeleteRecord }
        format.json { render :json => @main_system._hash }
        format.xml { render :xml => @main_system._hash }
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
    def set_main_system
      @main_system = MainSystem.where(id: params[:id]).first
      main_system_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_system_params
      params.require(:main_system).permit(:time_stamp, :acc_system_id)
    end

    def main_system_hash
      if !@main_system.blank? then
        @main_system_hash = { return_status: true, main_system: @main_system.as_json(include: { acc_system: { } } ) }
      else
        @main_system_hash = { return_status: false }
      end
    end

    def main_systems_hash
      if !@main_systems.blank? then
        @main_systems_hash = { return_status: true, main_systems: @main_systems.as_json(include: { acc_system: { } } ) }
      else
        @main_systems_hash = { return_status: false }
      end
    end
end
