class MoussaillonsController < ApplicationController
  before_action :set_moussaillon, only: [:show, :edit, :update, :destroy]

  # GET /moussaillons
  # GET /moussaillons.json
  def index
    @moussaillons = Moussaillon.all
  end

  # GET /moussaillons/1
  # GET /moussaillons/1.json
  def show
  end

  # GET /moussaillons/new
  def new
    @moussaillon = Moussaillon.new
  end

  # GET /moussaillons/1/edit
  def edit
  end

  # POST /moussaillons
  # POST /moussaillons.json
  def create
    @moussaillon = Moussaillon.new(moussaillon_params)

    respond_to do |format|
      if @moussaillon.save
        format.html { redirect_to @moussaillon, notice: 'Moussaillon was successfully created.' }
        format.json { render :show, status: :created, location: @moussaillon }
      else
        format.html { render :new }
        format.json { render json: @moussaillon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moussaillons/1
  # PATCH/PUT /moussaillons/1.json
  def update
    respond_to do |format|
      if @moussaillon.update(moussaillon_params)
        format.html { redirect_to @moussaillon, notice: 'Moussaillon was successfully updated.' }
        format.json { render :show, status: :ok, location: @moussaillon }
      else
        format.html { render :edit }
        format.json { render json: @moussaillon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moussaillons/1
  # DELETE /moussaillons/1.json
  def destroy
    @moussaillon.destroy
    respond_to do |format|
      format.html { redirect_to moussaillons_url, notice: 'Moussaillon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moussaillon
      @moussaillon = Moussaillon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moussaillon_params
      params.require(:moussaillon).permit(:username, :email, :bio)
    end
end
