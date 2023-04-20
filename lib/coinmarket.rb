require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_name_array = doc.xpath('//tbody/tr/td[3]').map do |name|
    name.text
end.take(20)

crypto_price_array = doc.xpath('//tbody/tr/td[5]').map do |price|
    price.text
end.take(20)

crypto_array = crypto_name_array.zip(crypto_price_array).map do |name, price| # Zip = combiner les deux tableaux
    { name: name, price: price }.values.join(" ")
end

puts crypto_array
