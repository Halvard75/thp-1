#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'

#  Je cherche les données de CoinMarket
def get_all_crypto_names_and_trading_values
  begin

    # Get html text from the url given
    page = HTTParty.get("https://coinmarketcap.com/all/views/all/")
    parse_page = Nokogiri::HTML(page)

    #Get crypto data names and put it in an array of hashes called crypto_data
    xpath_name = '//td[@class="no-wrap currency-name"]/ a'
    crypto_name_html = parse_page.xpath(xpath_name)


    crypto_data =[]
    crypto_name_html.each {|i| crypto_data << {:name => i.text, :value => 0} #je laisse la valeur à 0 car je récupère que le nom

    #Get for each crypto-currency the trading value
    xpath_crypto = '//a[@class="price"]/ @data-usd'
    crypto_trading_value = parse_page.xpath(xpath_crypto)

    #Fill the array of hash containing all the values
    (0..(crypto_data.length-1)).each do |j|
      crypto_data[j][:value] = crypto_trading_value[j].text.to_f
    end
    puts crypto_data
    crypto_data
  end
end

crypto_trading_values = get_all_crypto_names_and_trading_values
