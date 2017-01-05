class DocTypesController < ApplicationController
  before_action :set_doc_type, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /doc_types
  # GET /doc_types.json
  def index
    @doc_types = DocType.paginate(:page => params[:offset], :per_page => 20)

    doc_types_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @doc_types_hash }
      format.xml { render :xml => @doc_types_hash }
    end
  end

  # GET /doc_types/1
  # GET /doc_types/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @doc_type_hash }
      format.xml { render :xml => @doc_type_hash }
    end
  end

  # GET /doc_types/new
  def new
    @doc_type = DocType.new
  end

  # GET /doc_types/1/edit
  def edit
  end

  # POST /doc_types
  # POST /doc_types.json
  def create
    @doc_type = DocType.new(doc_type_params)

    respond_to do |format|
      if @doc_type.save
        doc_type_hash()
        format.html { redirect_to @doc_type, notice: $gcMsgAppendRecord }
        format.json { render :json => @doc_type_hash }
        format.xml { render :xml => @doc_type_hash }
      else
        lcHashError = { return_status: false, errors: @doc_type.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /doc_types/1
  # PATCH/PUT /doc_types/1.json
  def update
    respond_to do |format|
      if @doc_type.update(doc_type_params)
        doc_type_hash()
        format.html { redirect_to @doc_type, notice: $gcMsgUpdateRecord }
        format.json { render :json => @doc_type_hash }
        format.xml { render :xml => @doc_type_hash }
      else
        lcHashError = { return_status: false, errors: @doc_type.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /doc_types/1
  # DELETE /doc_types/1.json
  def destroy
    respond_to do |format|
      unless @doc_type.nil?
        doc_type_hash()
        @doc_type.destroy
        format.html { redirect_to doc_types_url,  notice:$gcMsgDeleteRecord }
        format.json { render :json => @doc_type_hash }
        format.xml { render :xml => @doc_type_hash }
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
    def set_doc_type
      @doc_type = DocType.where(id: params[:id]).first
      doc_type_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_type_params
      params.require(:doc_type).permit(:name)
    end

    def doc_type_hash
      if !@doc_type.blank? then
        @doc_type_hash = { return_status: true, doc_type: @doc_type }
      else
        @doc_type_hash = { return_status: false }
      end
    end

    def doc_types_hash
      if !@doc_types.blank? then
        @doc_types_hash = { return_status: true, doc_types: @doc_types }
      else
        @doc_types_hash = { return_status: false }
      end
    end
end
