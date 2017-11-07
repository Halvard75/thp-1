class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  def new
    @gossip=current_moussaillon.gossips.new
  end

  def create
    @moussaillon=current_moussaillon
    @gossip=@moussaillon.gossips.new(gossip_params)
    if @gossip.save
      flash[:success] = "You successfully created the gossip!"
      redirect_to gossips_path
      @gossip.save
    else
      render 'new'
      flash.now[:error] = "Gossip could not be created"
    end
  end

  def gossip_params
     params.require(:gossip).permit(:content)
  end


  # GET /gossips
  # GET /gossips.json
  def index
    @gossips = Gossip.all
  end

  # GET /gossips/1
  # GET /gossips/1.json
  def show
    @gossip = Gossip.find(params[:id])
  end
=begin
  # GET /gossips/new
  def new
    @gossip = Gossip.new
    @moussaillon = Moussaillon.find_by(id: gossip_params[:moussaillon_id])
  end
=end
  # GET /gossips/1/edit
  def edit
  end
=begin
  # POST /gossips
  # POST /gossips.json
  def create
    @moussaillon = current_moussaillon
    @gossip = Gossip.new(gossip_params)


    respond_to do |format|
      if @gossip.save
        format.html { redirect_to @gossip, notice: 'Gossip was successfully created.' }
        format.json { render :show, status: :created, location: @gossip }
      else
        format.html { render :new }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # PATCH/PUT /gossips/1
  # PATCH/PUT /gossips/1.json
  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1
  # DELETE /gossips/1.json
  def destroy
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: 'Gossip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
=begin
  # Never trust parameters from the scary internet, only allow the white list through.
  def gossip_params
    params.permit(:content, :moussaillon_id)
  end
=end 
end