require 'nokogiri'
require 'open-uri'


# Récupérer les URL des villes
doc_url = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
city_url = doc_url.xpath("//a[@class='lientxt']/@href").map do |url|
    url.text
end


# Récupérer les noms des communes
doc_city = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
city_names = doc_city.xpath("//p/a").map do |names|
    names.text
end
    

#Récupérer les adresses e-mail de chaque commune
email_city_array = city_url.map do |url| 
    doc_email = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{url.slice!(1..url.length)}"))
    city_email = doc_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

# FUSION
fusion_array = city_names.zip(email_city_array).map do |name, email|
    {"#{name}": email}
end

puts fusion_array