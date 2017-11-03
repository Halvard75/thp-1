#! /usr/bin/env ruby
require 'pry'
require 'nokogiri'
require 'open-uri'

#je scrap les urls
doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

url_links = doc.css("a.lientxt")
url_links.each{|link| puts "http://annuaire-des-mairies.com" + link['href']}   

#je scrap le mail par site
doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))

doc.css('p:contains("@")').each do |mail|
puts mail.text
end

#je tape une boucle qui sort chaque mail par url
array.each_with_index do |element,index|
  element.do_stuff(index)
end
