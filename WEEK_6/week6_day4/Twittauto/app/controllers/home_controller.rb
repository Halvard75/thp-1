class HomeController < ApplicationController
  #je mets la fonction dont j'ai besoin dans mon controller 
  def index
    if params.key?(:tweeter)
      @msg = params_tweet
      SendTweet.new @msg
    end
  end

  private

  def params_tweet
    params_tweet = params.permit(:tweeter).require(:tweeter)
  end
end