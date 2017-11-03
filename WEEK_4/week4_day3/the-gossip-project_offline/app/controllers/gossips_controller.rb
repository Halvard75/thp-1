class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def create
    @gossip = Gossip.new(gossip_params)

    if @gossip.save
      redirect_to @gossip
    else
      render 'new'
    end
  end

  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    redirect_to gossips_path
  end
  def show
    @gossip = Gossip.find(params[:id])
    puts "ceci est un gossip #{@gossip}"
  end

  def index
    @gossips = Gossip.all
  end

  private

  def gossip_params
    params.permit(:anonymous_author, :content)
  end

end