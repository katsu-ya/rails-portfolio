class MycontactsController < ApplicationController
  before_action :set_mycontact, only: %i[ show edit update destroy ]

  # GET /mycontacts or /mycontacts.json
  def index
    @mycontacts = Mycontact.all
  end

  # GET /mycontacts/1 or /mycontacts/1.json
  def show
  end

  # GET /mycontacts/new
  def new
    @mycontact = Mycontact.new
  end

  # GET /mycontacts/1/edit
  def edit
  end

  # POST /mycontacts or /mycontacts.json
  def create
    @mycontact = Mycontact.new(mycontact_params)

    respond_to do |format|
      if @mycontact.save
        format.html { redirect_to @mycontact, notice: "Mycontact was successfully created." }
        format.json { render :show, status: :created, location: @mycontact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mycontacts/1 or /mycontacts/1.json
  def update
    respond_to do |format|
      if @mycontact.update(mycontact_params)
        format.html { redirect_to @mycontact, notice: "Mycontact was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @mycontact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mycontacts/1 or /mycontacts/1.json
  def destroy
    @mycontact.destroy!

    respond_to do |format|
      format.html { redirect_to mycontacts_path, notice: "Mycontact was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycontact
      @mycontact = Mycontact.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mycontact_params
      params.expect(mycontact: [ :name, :age, :nationality, :mail ])
    end
end
