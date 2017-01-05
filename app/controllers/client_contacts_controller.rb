class ClientContactsController < ApplicationController
  before_action :set_client_contact, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}

  # GET /client_contacts
  # GET /client_contacts.json
  def index
    @client_contacts = ClientContact.paginate(:page => params[:offset], :per_page => 20)

    client_contacts_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @client_contacts_hash }
      format.xml { render :xml => @client_contacts_hash }
    end
  end

  # GET /client_contacts/1
  # GET /client_contacts/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @client_contact_hash }
      format.xml { render :xml => @client_contact_hash }
    end
  end

  # GET /client_contacts/new
  def new
    @client_contact = ClientContact.new
  end

  # GET /client_contacts/1/edit
  def edit
  end

  # POST /client_contacts
  # POST /client_contacts.json
  def create
    @client_contact = ClientContact.new(client_contact_params)

    respond_to do |format|
      if @client_contact.save
        client_contact_hash()
        format.html { redirect_to @client_contact, notice: $gcMsgAppendRecord }
        format.json { render :json => @client_contact_hash }
        format.xml { render :xml => @client_contact_hash }
      else
        lcHashError = { return_status: false, errors: @client_contact.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /client_contacts/1
  # PATCH/PUT /client_contacts/1.json
  def update
    respond_to do |format|
      if @client_contact.update(client_contact_params)
        client_contact_hash()
        format.html { redirect_to @client_contact, notice: $gcMsgUpdateRecord }
        format.json { render :json => @client_contact_hash }
        format.xml { render :xml => @client_contact_hash }
      else
        lcHashError = { return_status: false, errors: @client_contact.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /client_contacts/1
  # DELETE /client_contacts/1.json
  def destroy
    respond_to do |format|
      unless @client_contact.nil?
        client_contact_hash()
        @client_contact.destroy
        format.html { redirect_to client_contacts_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @client_contact_hash }
        format.xml { render :xml => @client_contact_hash }
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
    def set_client_contact
      @client_contact = ClientContact.where(id: params[:id]).first
      client_contact_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_contact_params
      params.require(:client_contact).permit(:person_id, :client_id)
    end

    def client_contact_hash
      if !@client_contact.blank? then
        @client_contact_hash = { return_status: true, client_contact: @client_contact.as_json(include: { client: { include: :client_type } , person: {} } ) }
      else
        @client_contact_hash = { return_status: false }
      end
    end

    def client_contacts_hash
      if !@client_contacts.blank? then
        @client_contacts_hash = { return_status: true, client_contacts: @client_contacts.as_json(include: { client: { include: :client_type } , person: {} } ) }
      else
        @client_contacts_hash = { return_status: false }
      end
    end
end
