require 'twitter'

class SendTweet
#init le string en parametre
  def initialize(msg = "tweet 280 babe")
    @msg = msg
    log_in_to_twitter
    send_tweet
  end

#je me log sur twitter
  def log_in_to_twitter
    @client = Twitter::REST::Client.new do |config|
    	#https://apps.twitter.com/app/14450234

    end
  end

#j'envoi un tweet
  def send_tweet
    @client.update(@msg)
  end

end
