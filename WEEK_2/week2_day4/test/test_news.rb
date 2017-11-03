require 'rubygems'
require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://www.journaux.fr/generaliste-etrangers_adultes_1_0_100071.html"))

news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet   