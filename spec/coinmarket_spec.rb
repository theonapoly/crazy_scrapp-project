require_relative '../lib/coinmarket.rb'
require 'nokogiri'
require 'open-uri'

RSpec.describe "Coinmarketcap data" do
  before(:all) do
    @doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    @crypto_name_array = @doc.xpath('//tbody/tr/td[3]').map do |name|
      name.text
    end.take(20)
    @crypto_price_array = @doc.xpath('//tbody/tr/td[5]').map do |price|
      price.text
    end.take(20)
    @crypto_array = @crypto_name_array.zip(@crypto_price_array).map do |name, price|
      { name: name, price: price }
    end
  end

  describe "crypto_name_array" do
    it "contains only strings" do
      expect(@crypto_name_array).to all(be_a(String))
    end

    it "contains at most 20 elements" do
      expect(@crypto_name_array.length).to be <= 20
    end
  end

  describe "crypto_price_array" do
    it "contains only strings" do
      expect(@crypto_price_array).to all(be_a(String))
    end

    it "contains at most 20 elements" do
      expect(@crypto_price_array.length).to be <= 20
    end
  end

  describe "crypto_array" do
    it "contains only hashes" do
      expect(@crypto_array).to all(be_a(Hash))
    end

    it "has at most 20 elements" do
      expect(@crypto_array.length).to be <= 20
    end

    it "each hash has a :name key with a string value" do
      expect(@crypto_array).to all(include(:name))
      expect(@crypto_array.map { |h| h[:name] }).to all(be_a(String))
    end

    it "each hash has a :price key with a string value" do
      expect(@crypto_array).to all(include(:price))
      expect(@crypto_array.map { |h| h[:price] }).to all(be_a(String))
    end
  end
end




crypto_array.each do |hash|
  puts hash.values.join(" ")
end