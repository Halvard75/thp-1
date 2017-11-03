require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'HTTParty'
require 'Pry'




#2 mail
def get_the_email_of_a_townhal_from_its_webpage (url_mairie)
  doc = Nokogiri::HTML(page)
  news_mailto = doc.css('p:contains("@")')
  news_mailto.each{|mail| puts mail.text}
end



#1 url
puts "--1--"
doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

news_links = doc.css("a.lientxt")
puts news_links

news_links_final = []
news_links_final.each {|i| news_links << {:ville => link.content ,:url => "http://annuaire-des-mairies.com/#{i["href"].gsub("./","")}",:email => ""}}
puts news_links_final

