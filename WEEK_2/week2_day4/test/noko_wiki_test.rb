require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://www.interieur.gouv.fr/Le-ministere/Collectivites-territoriales"))   
puts page.class   # => Nokogiri::HTML::Document
  
   puts "### Search for nodes by css"
page.css('title').each do |link|
  puts link.content
end

links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com

news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com
         
puts news_links.class   #=>   Array         
