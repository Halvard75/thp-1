require 'Twitter'

x = "\n"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "jjZuYSRmD8F7KL8bTmZBWGew7"
  config.consumer_secret     = "C38h5gNZsjcPFDIAMDrgfzk3lukObfPOUZ8H8MBudvZXnXGTMa"
  config.access_token        = "328247536-WqU4avqhmyXNyYsdjzt0bMWFruQsbin895MEV2dn"
  config.access_token_secret = "XccIZ0j2kONfM9CTBDUnVabn8yjInUv2xH3Tjvtx6yTS6"
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
  config.consumer_key        = "EiYbW4MOQ78gCu5no1xyLVY0L"
  config.consumer_secret     = "FRMz92Cz0AUp4ly9vWrn3LRKFq6xlwLhncz12Ef6mEAxBH9FKU"
  config.access_token        = "328247536-wC6uf3B16RcL5W8xAs7zs5Z1JzQKDdAGM89DmSz1"
  config.access_token_secret = "AKI2vfuirxS0Gjcoh1pgktCARN2B0rf8TBGLxcXnG0yn4"
end



topics = ["Paris"]
client.filter(:track => topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
 client.favorite(object)
end
=end