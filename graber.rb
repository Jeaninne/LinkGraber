require 'net/http'
require 'nokogiri'
require 'open-uri'

class Link_graber
 attr_accessor :link 

 def initialize(link)
 @link= Nokogiri::HTML(open(link))
 end

 def write_in_file
  #write array in file
 end

 def parse(page_name)
  doc = Nokogiri::HTML(open(page_name))
  doc.xpath('//a').each do |link|
  puts link[:href]
  end
 end

 def find_links(page_name, depth)
  #go to the link
  #call method find_links and write result 
  #if depth > 1 then
  #foreach
  #call find_links(page_name, depth-1)
  #esle return array of links
 end

end

x = Link_graber.new('http://kote.dp.ua/')
p x.parse('http://kote.dp.ua/')