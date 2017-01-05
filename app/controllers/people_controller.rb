class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json'}
  
  # GET /people
  # GET /people.json
  def index
    @people = Person.paginate(:page => params[:offset], :per_page => 20)

    people_hash()
    respond_to do |format|
      format.html
      format.json { render :json => @people_hash }
      format.xml { render :xml => @people_hash }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @person_hash }
      format.xml { render :xml => @person_hash }
    end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        person_hash()
        format.html { redirect_to @person, notice: $gcMsgAppendRecord }
        format.json { render :json => @person_hash }
        format.xml { render :xml => @person_hash }
      else
        lcHashError = { return_status: false, errors: @person.errors }
        format.html { render :new }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        person_hash()
        format.html { redirect_to @person, notice: $gcMsgUpdateRecord }
        format.json { render :json => @person_hash }
        format.xml { render :xml => @person_hash }
      else
        lcHashError = { return_status: false, errors: @person.errors }
        format.html { render :edit }
        format.json { render :json => lcHashError }
        format.xml { render :xml => lcHashError }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    respond_to do |format|
      unless @person.nil?
        person_hash()
        @person.destroy
        format.html { redirect_to people_url, notice: $gcMsgDeleteRecord }
        format.json { render :json => @person_hash }
        format.xml { render :xml => @person_hash }
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
    def set_person
      @person = Person.where(id: params[:id]).first
      person_hash()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :first_name, :second_name, :last_name, :cellphone, :inn)
    end

    def person_hash
      if !@person.blank? then
        @person_hash = { return_status: true, person: @person }
      else
        @person_hash = { return_status: false }
      end
    end

    def people_hash
      if !@people.blank? then
        @people_hash = { return_status: true, people: @people }
      else
        @people_hash = { return_status: false }
      end
    end
end
