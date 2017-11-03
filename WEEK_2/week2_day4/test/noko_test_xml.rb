#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://www.google.fr/search?q=doughnuts&gws_rd=cr,ssl&dcr=0&ei=IEjeWe2-GcryaJT-jZAK'))





puts "### Search for nodes by xpath new"
doc.xpath('//h3/a').each do |node|
  puts node.text
end