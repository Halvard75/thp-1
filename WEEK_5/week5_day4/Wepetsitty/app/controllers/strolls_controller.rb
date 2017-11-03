class StrollsController < ApplicationController
  before_action :set_stroll, only: [:show, :edit, :update, :destroy]

  # GET /strolls
  # GET /strolls.json
  def index
    @strolls = Stroll.all
  end

  # GET /strolls/1
  # GET /strolls/1.json
  def show
  end

  # GET /strolls/new
  def new
    @stroll = Stroll.new
  end

  # GET /strolls/1/edit
  def edit
  end

  # POST /strolls
  # POST /strolls.json
  def create
    @stroll = Stroll.new(stroll_params)

    respond_to do |format|
      if @stroll.save
        format.html { redirect_to @stroll, notice: 'Stroll was successfully created.' }
        format.json { render :show, status: :created, location: @stroll }
      else
        format.html { render :new }
        format.json { render json: @stroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strolls/1
  # PATCH/PUT /strolls/1.json
  def update
    respond_to do |format|
      if @stroll.update(stroll_params)
        format.html { redirect_to @stroll, notice: 'Stroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @stroll }
      else
        format.html { render :edit }
        format.json { render json: @stroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strolls/1
  # DELETE /strolls/1.json
  def destroy
    @stroll.destroy
    respond_to do |format|
      format.html { redirect_to strolls_url, notice: 'Stroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stroll
      @stroll = Stroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stroll_params
      params.require(:stroll).permit(:date, :dogsitter_id, :dog_id)
    end
end
