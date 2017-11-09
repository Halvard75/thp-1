require 'twitter'

class SendTweet

  def initialize(msg = "Tweet as services")
    @msg = msg
    log_in_to_twitter
    send_tweet
  end

  def log_in_to_twitter
    @client = Twitter::REST::Client.new do |config|
    	#https://apps.twitter.com/app/14450234
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end
  end

  def send_tweet
    @client.update(@msg)
  end

end
