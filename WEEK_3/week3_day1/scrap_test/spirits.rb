require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'Pry'

def get_array_of_hashes_to_csv (array_of_hashes,file_name)
  CSV.open(file_name, "wb") do |csv|
    csv << ["Type", "Marque", "Pays", "Degre", "Volume", "Tourbe"]
    array_of_hashes.each do |hash|
      csv << hash.values
    end
  end
  puts "Ton fichier #{file_name} est prêt bro"
end

#Methode pour recuperer toutes les datas interessantes

#Define a method to get the "type"
def get_the_type (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  type = []
  xpath1 ='//span[@class="data"]'
  type = parse_page.xpath(xpath1)
  type.text
end

#Define a method to get the "marque"
def get_the_marque (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  marque = []
  xpath2 ='//li[@class="product"]'
  marque = parse_page.xpath(xpath2)
  marque.text
end

#Define a method to get the "pays"
def get_the_pays (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  pays = []
  xpath3 ='//span[@class="data _origin_country"]'
  pays = parse_page.xpath(xpath3)
  pays.text
end

#Define a method to get the "degré"
def get_the_degre (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  degre = []
  xpath4 ='//span[@class="data strength"]'
  degre = parse_page.xpath(xpath4)
  degre.text
end

#Define a method to get the "volume"
def get_the_volume (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  volume = []
  xpath5 ='//span[@class="data volume"]'
  volume = parse_page.xpath(xpath5)
  volume.text
end

#Define a method to get the "tourbe"
def get_the_tourbe (url_lmdw)
  page = HTTParty.get(url_lmdw)
  parse_page = Nokogiri::HTML(page)
  tourbe = []
  xpath8 ='//span[@class="data tourbe"]'
  tourbe = parse_page.xpath(xpath8)
  tourbe.text
end


def get_all_info_from_lmdw_url (url_marque, marque)

  page = HTTParty.get(url_marque)
  parse_page = Nokogiri::HTML(page)

  url_page_list = []
  xpath6 = '//h2[@class="product-name"]/a'
  url_page_list = parse_page.xpath(xpath6)
puts "\n n°1 #{url_page_list}"

  url_page_list_final =[]
  url_page_list.each {|i| url_page_list_final << {:marque2 => i.text ,:url2 => "#{i["href"]}"}}
puts "\n n°2 #{url_page_list_final}"

  table_info=[]

  url_page_list_final.each {|j|
    table_info << {:type => get_the_type(j[:url2]), :marque_alcool => get_the_marque(j[:url2]), :pays => get_the_pays(j[:url2]), :degre => get_the_degre(j[:url2]), :volume => get_the_volume(j[:url2]), :tourbe => get_the_tourbe(j[:url2])}
  }
puts "\n n°3 #{table_info}"
  table_info
end

def get_all_product_from_lmdw
  url_scrapping= "http://www.whisky.fr/marque.html"

  page = HTTParty.get(url_scrapping)
  parse_page = Nokogiri::HTML(page)

  url_page_marque_list = []
  url_page_marque_list_final = [] 
  xpath7 = '//*[@id="alphabetic-list"]/li/a'
  url_page_marque_list = parse_page.xpath(xpath7)
puts "\n n°4 #{url_page_marque_list}"

  url_page_marque_list.each {|i|
    url_page_marque_list_final << {:marque => i.text, :url_marque => "#{i['href']}"}
  }
puts "\n n°5 #{url_page_marque_list_final}"
  array_all_marque_url = []
  url_page_marque_list_final.each do |j|
    array_all_marque_url += get_all_info_from_lmdw_url(j[:url_marque],j[:marque])
puts "\n n°6 #{array_all_marque_url}"
  end

  get_array_of_hashes_to_csv(array_all_marque_url,"all_ref_lmdw.csv")
end

get_all_product_from_lmdw
