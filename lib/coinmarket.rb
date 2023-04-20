require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_name_array = doc.xpath('//tbody/tr/td[5]').each do |name|
puts name.text
end

result_array = []

