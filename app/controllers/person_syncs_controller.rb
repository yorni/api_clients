class PersonSyncsController < ApplicationController
  before_action :set_person_sync, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /person_syncs
  # GET /person_syncs.json
  def index
    @person_syncs = PersonSync.paginate(:page => params[:offset], :per_page => 20)

    person_syncs_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @person_syncs_hash }
      format.xml { render :xml => @person_syncs_hash }
    end
  end

  # GET /person_syncs/1
  # GET /person_syncs/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @person_sync_hash }
      format.xml { render :xml => @person_sync_hash }
    end
  end

  # GET /person_syncs/new
  def new
    @person_sync = PersonSync.new
  end

  # GET /person_syncs/1/edit
  def edit
  end

  # POST /person_syncs
  # POST /person_syncs.json
  def create
    @person_sync = PersonSync.new(person_sync_params)

    respond_to do |format|
      if @person_sync.save
        person_sync_hash()
        format.html { redirect_to @person_sync, notice: $gcMsgAppendRecord }
        format.json { render :json => @person_sync_hash }
        format.xml { render :xml => @person_sync_hash }
      else
        lcHashError = { return_status: false, errors: @person_sync.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /person_syncs/1
  # PATCH/PUT /person_syncs/1.json
  def update
    respond_to do |format|
      if @person_sync.update(person_sync_params)
        person_sync_hash()
        format.html { redirect_to @person_sync, notice: $gcMsgUpdateRecord }
        format.json { render :json => @person_sync_hash }
        format.xml { render :xml => @person_sync_hash }
      else
        lcHashError = { return_status: false, errors: @person_sync.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /person_syncs/1
  # DELETE /person_syncs/1.json
  def destroy
    respond_to do |format|
      unless @person_sync.nil?
        person_sync_hash()
        @person_sync.destroy
        format.html { redirect_to person_syncs_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @person_sync_hash }
        format.xml { render :xml => @person_sync_hash }
      else
        lcHashError = { return_status: false }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  private
    def set_person_sync
      @person_sync = PersonSync.where(id: params[:id]).first
      person_sync_hash()
    end

    def person_sync_params
      params.require(:person_sync).permit(:person_id, :acc_system_id, :time_stamp)
    end

    def person_sync_hash
      if !@person_sync.blank? then
        @person_sync_hash = { return_status: true, person_sync: @person_sync.as_json(include: { person: {}, acc_system: {} } ) }
      else
        @person_sync_hash = { return_status: false }
      end
    end

    def person_syncs_hash
      if !@person_syncs.blank? then
        @person_syncs_hash = { return_status: true, person_syncs: @person_syncs.as_json(include: { person: {}, acc_system: {} } ) }
      else
        @person_syncs_hash = { return_status: false }
      end
    end
end
