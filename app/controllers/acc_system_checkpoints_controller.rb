class AccSystemCheckpointsController < ApplicationController
  before_action :set_acc_system_checkpoint, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /acc_system_checkpoints
  # GET /acc_system_checkpoints.json
  def index
    @acc_system_checkpoints = AccSystemCheckpoint.paginate(:page => params[:offset], :per_page => 20)

    acc_system_checkpoints_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @acc_system_checkpoints_hash }
      format.xml { render :xml => @acc_system_checkpoints_hash }
    end
  end

  # GET /acc_system_checkpoints/1
  # GET /acc_system_checkpoints/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @acc_system_checkpoint_hash }
      format.xml { render :xml => @acc_system_checkpoint_hash }
    end
  end

  # GET /acc_system_checkpoints/new
  def new
    @acc_system_checkpoint = AccSystemCheckpoint.new
  end

  # GET /acc_system_checkpoints/1/edit
  def edit
  end

  # POST /acc_system_checkpoints
  # POST /acc_system_checkpoints.json
  def create
    @acc_system_checkpoint = AccSystemCheckpoint.new(acc_system_checkpoint_params)

    respond_to do |format|
      if @acc_system_checkpoint.save
        acc_system_checkpoint_hash()
        format.html { redirect_to @acc_system_checkpoint, notice: $gcMsgAppendRecord }
        format.json { render :json => @acc_system_checkpoint_hash }
        format.xml { render :xml => @acc_system_checkpoint_hash }
      else
        lcHashError = { return_status: false, errors: @acc_system_checkpoint.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /acc_system_checkpoints/1
  # PATCH/PUT /acc_system_checkpoints/1.json
  def update
    respond_to do |format|
      if @acc_system_checkpoint.update(acc_system_checkpoint_params)
        acc_system_checkpoint_hash()
        format.html { redirect_to @acc_system_checkpoint, notice: $gcMsgAppendRecord }
        format.json { render :json => @acc_system_checkpoint_hash }
        format.xml { render :xml => @acc_system_checkpoint_hash }
      else
        lcHashError = { return_status: false, errors: @acc_system_checkpoint.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /acc_system_checkpoints/1
  # DELETE /acc_system_checkpoints/1.json
  def destroy
    respond_to do |format|
      unless @acc_system_checkpoint.nil?
        acc_system_checkpoint_hash()
        @acc_system_checkpoint.destroy
        format.html { redirect_to acc_system_checkpoints_url,  notice: $gcMsgDeleteRecord }
        format.json { render :json => @acc_system_checkpoint_hash }
        format.xml { render :xml => @acc_system_checkpoint_hash }
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
    def set_acc_system_checkpoint
      @acc_system_checkpoint = AccSystemCheckpoint.where(id: params[:id]).first
      acc_system_checkpoint_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_system_checkpoint_params
      params.require(:acc_system_checkpoint).permit(:acc_system_id, :time_stamp)
    end

    def acc_system_checkpoint_hash
      if !@acc_system_checkpoint.blank? then
        @acc_system_checkpoint_hash = { return_status: true, acc_system_checkpoint: @acc_system_checkpoint.as_json( include: :acc_system ) }
      else
        @acc_system_checkpoint_hash = { return_status: false }
      end
    end

    def acc_system_checkpoints_hash
      if !@acc_system_checkpoints.blank? then
        @acc_system_checkpoints_hash = { return_status: true, acc_system_checkpoints: @acc_system_checkpoints.as_json( include: :acc_system ) }
      else
        @acc_system_checkpoints_hash = { return_status: false }
      end
    end
end
