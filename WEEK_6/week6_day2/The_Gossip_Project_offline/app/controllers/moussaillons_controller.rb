class MoussaillonssController < ApplicationController
  before_action :login_required, except:[:new,:create]

  def new
    @moussaillon=Moussaillon.new
  end

  def create
    @moussaillon = User.new(moussaillon_params)
    if @moussaillon.save
      log_in @moussaillon
      flash[:success] = "Welcome to Gossip THP!"
      redirect_to @moussaillon
    else
      render 'new'
    end
  end

  def show
    @moussaillon = Moussaillon.find(params[:id])
  end

  def moussaillon_params
      params.require(:moussaillon).permit(:username, :email, :password_digest)
  end

end