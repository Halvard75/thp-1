class DogsittersController < ApplicationController
  before_action :set_dogsitter, only: [:show, :edit, :update, :destroy]

  # GET /dogsitters
  # GET /dogsitters.json
  def index
    @dogsitters = Dogsitter.all
  end

  # GET /dogsitters/1
  # GET /dogsitters/1.json
  def show
  end

  # GET /dogsitters/new
  def new
    @dogsitter = Dogsitter.new
  end

  # GET /dogsitters/1/edit
  def edit
  end

  # POST /dogsitters
  # POST /dogsitters.json
  def create
    @dogsitter = Dogsitter.new(dogsitter_params)

    respond_to do |format|
      if @dogsitter.save
        format.html { redirect_to @dogsitter, notice: 'Dogsitter was successfully created.' }
        format.json { render :show, status: :created, location: @dogsitter }
      else
        format.html { render :new }
        format.json { render json: @dogsitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogsitters/1
  # PATCH/PUT /dogsitters/1.json
  def update
    respond_to do |format|
      if @dogsitter.update(dogsitter_params)
        format.html { redirect_to @dogsitter, notice: 'Dogsitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @dogsitter }
      else
        format.html { render :edit }
        format.json { render json: @dogsitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogsitters/1
  # DELETE /dogsitters/1.json
  def destroy
    @dogsitter.destroy
    respond_to do |format|
      format.html { redirect_to dogsitters_url, notice: 'Dogsitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dogsitter
      @dogsitter = Dogsitter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dogsitter_params
      params.require(:dogsitter).permit(:first_name, :last_name)
    end
end
