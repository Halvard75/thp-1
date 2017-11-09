require 'Twitter'

x = "\n"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "x"
  config.consumer_secret     = "x"
  config.access_token        = "x-x"
  config.access_token_secret = "x"
end

#client.update('Tweet from the command line!')  --tweet from le lancement de ruby



#client.search("to:elonmusk", lang: "fr", resultat_type: "popular").take(1).each do |tweet|
 # puts tweet.text
  #client.home_timeline
#end





	
search_options = {
  result_type: "recent",
  lang: "fr",
  geocode: "48.856924,2.352684,10mi"
}

client.search("uber", search_options).take(500).each do |tweet|
  puts tweet.text
# client.favorite(tweet)
# client.update("@" + tweet.user.screen_name + " Welcome to Philadelphia!")
end

#client.follow(tweet.user.)

=begin


client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "x"
  config.consumer_secret     = "x"
  config.access_token        = "x-x"
  config.access_token_secret = "x"
end



topics = ["Paris"]
client.filter(:track => topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
 client.favorite(object)
end
=end