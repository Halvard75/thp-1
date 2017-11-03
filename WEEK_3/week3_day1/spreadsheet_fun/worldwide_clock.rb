#Set the required gems for scrapping / parsing
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'json'


#Define a method to transform an array of hashed with same keys into a csv file
def get_array_of_hashes_to_csv (array_of_hashes,file_name)
  #Write it into a CSV file
  CSV.open(file_name, "wb") do |csv|
    csv << ["Ville", "Hour"]
    array_of_hashes.each do |hash|
      csv << hash.values
    end
  end
  puts "The data has been put in a csv file #{file_name}"
end

#Puts object in JSON file
def puts_object_in_json_file (object, file_name)

  File.open(file_name,"w") do |f|
    f.write(object.to_json)
  end
  puts "The data has been put in a json file #{file_name}"
end

def get_all_city_names_and_hour_values
  begin

    # Get html text from the url given
    page = HTTParty.get("https://www.ephemeride.com/atlas/fuseaux/24/fuseaux-horaires-et-decalage-horaire.html")
    parse_page = Nokogiri::HTML(page)

    #Get weather data names and put it in an array of hashes called weather_data
    xpath_name = '//*[@id="sortable_table"]/tbody/tr/td[2]/a'
    xpath_hour = '//*[@id="sortable_table"]/tbody/tr/td[4]'
    city_name_html = parse_page.xpath(xpath_name)
    city_decalage_html = parse_page.xpath(xpath_hour)


    clock_data =[]
    city_name_html.each {|i| clock_data << {:name => i.text}} #je laisse la valeur à 0 car je récupère que le nom
    #    city_decalage_html.each {|j| clock_data << {:value => j.text}}

    (0..(clock_data.length-1)).each do |j|
      clock_data[j][:value] = city_decalage_html[j].text
    end

    puts clock_data

  end

  get_array_of_hashes_to_csv(clock_data,"all_worlwide_hour.csv")
  puts_object_in_json_file(clock_data,"all_worlwide_hour.json")
end


get_all_city_names_and_hour_values #obligatoire
