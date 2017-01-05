class ClientDocumentsController < ApplicationController
  before_action :set_client_document, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_documents
  # GET /client_documents.json
  def index
    @client_documents = ClientDocument.paginate(:page => params[:offset], :per_page => 20)

    client_documents_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_documents_hash }
      format.xml { render :xml => @client_documents_hash }
    end
  end

  # GET /client_documents/1
  # GET /client_documents/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_document_hash }
      format.xml { render :xml => @client_document_hash }
    end
  end

  # GET /client_documents/new
  def new
    @client_document = ClientDocument.new
  end

  # GET /client_documents/1/edit
  def edit
  end

  # POST /client_documents
  # POST /client_documents.json
  def create
    @client_document = ClientDocument.new(client_document_params)

    respond_to do |format|
      if @client_document.save
        client_document_hash()
        format.html { redirect_to @client_document, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_document_hash }
        format.xml { render :xml => @client_document_hash }
      else
        lcHashError = { return_status: false, errors: @client_document.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_documents/1
  # PATCH/PUT /client_documents/1.json
  def update
    respond_to do |format|
      if @client_document.update(client_document_params)
        client_document_hash()
        format.html { redirect_to @client_document, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_document_hash }
        format.xml { render :xml => @client_document_hash }
      else
        lcHashError = { return_status: false, errors: @client_document.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_documents/1
  # DELETE /client_documents/1.json
  def destroy
    respond_to do |format|
      unless @client_document.nil?
        client_document_hash()
        @client.destroy
        format.html { redirect_to client_documents_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_document._hash }
        format.xml { render :xml => @client_document._hash }
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
    def set_client_document
      @client_document = ClientDocument.where(id: params[:id]).first
      client_document_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_document_params
      params.require(:client_document).permit(:doc_type_id, :client_id, :doc_serial, :doc_number)
    end

    def client_document_hash
      if !@client_document.blank? then
        @client_document_hash = { return_status: true, client_document: @client_document.as_json(include: { client: { include: :client_type } , doc_type: { } } ) }
      else
        @client_document_hash = { return_status: false }
      end
    end

    def client_documents_hash
      if !@client_documents.blank? then
        @client_documents_hash = { return_status: true, client_documents: @client_documents.as_json(include: { client: { include: :client_type } , doc_type: { } } ) }
      else
        @client_documents_hash = { return_status: false }
      end
    end
end
