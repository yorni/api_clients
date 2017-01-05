class LocksController < ApplicationController
  before_action :set_lock, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /locks
  # GET /locks.json
  def index
    @locks = Lock.paginate(:page => params[:offset], :per_page => 20)

    locks_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @locks_hash }
      format.xml { render :xml => @locks_hash }
    end
  end

  # GET /locks/1
  # GET /locks/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @lock_hash }
      format.xml { render :xml => @lock_hash }
    end
  end

  # GET /locks/new
  def new
    @lock = Lock.new
  end

  # GET /locks/1/edit
  def edit
  end

  # POST /locks
  # POST /locks.json
  def create
    @lock = Lock.new(lock_params)

    respond_to do |format|
      if @lock.save
        lock_hash()
        format.html { redirect_to @lock, notice: $gcMsgAppendRecord }
        format.json { render :json => @lock_hash }
        format.xml { render :xml => @lock_hash }
      else
        lcHashError = { return_status: false, errors: @lock.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /locks/1
  # PATCH/PUT /locks/1.json
  def update
    respond_to do |format|
      if @lock.update(lock_params)
        lock_hash()
        format.html { redirect_to @lock, notice: $gcMsgUpdateRecord }
        format.json { render :json => @lock_hash }
        format.xml { render :xml => @lock_hash }
      else
        lcHashError = { return_status: false, errors: @lock.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /locks/1
  # DELETE /locks/1.json
  def destroy
    respond_to do |format|
      unless @lock.nil?
        lock_hash()
        @lock.destroy
        format.html { redirect_to locks_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @lock._hash }
        format.xml { render :xml => @lock._hash }
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
    def set_lock
      @lock = Lock.where(id: params[:id]).first
      lock_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lock_params
      params.require(:lock).permit(:client_id, :acc_system_id, :time_stamp)
    end

    def lock_hash
      if !@lock.blank? then
        @lock_hash = { return_status: true, lock: @lock.as_json( include: { client: { include: :client_type } , acc_system: { } } ) }
      else
        @lock_hash = { return_status: false }
      end
    end

    def locks_hash
      if !@locks.blank? then
        @locks_hash = { return_status: true, locks: @locks.as_json( include: { client: { include: :client_type } ,acc_system: { } } ) }
      else
        @locks_hash = { return_status: false }
      end
    end
end
