class HomeController < ApplicationController
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