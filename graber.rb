require 'net/http'
require 'nokogiri'
require 'open-uri'

class Link_graber

 def initialize
  File.open('data.txt', 'w'){}
 end

 def write_in_file(string)
  File.open('data.txt', 'a'){ |file| file.puts  string }
 end

 def parse(page_name)
  links = []
  doc = Nokogiri::HTML(open(page_name))
   doc.xpath('//a').each do |link|
   if !((link[:href]=='#') || (link[:href]== nil)) then 
     if link[:href].include?('http') 
      then links << link[:href]  
           end
     end
  end
  links
 end

 def find_links(page_name, depth)
  File.open('data.txt', 'a'){ |file| file.puts  "#{depth} depht. Links on #{page_name}:" }
  links_array = parse(page_name)
  if depth > 1 then 
   links_array.each {|page| find_links(page, depth-1)
    write_in_file(page)}
  else links_array.each {|page| write_in_file(page)}
   end
 end

end

x = Link_graber.new
x.find_links('http://kote.dp.ua/', 2)
