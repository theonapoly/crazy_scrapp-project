require_relative '../lib/coinmarket.rb'

describe "the dark trader" do
    it "should open a HTML page" do

        url = "https://example"
        uri_double = double('URI')
        allow(uri_double).to receive(:open)
        expect(uri_double).to receive(:open).with(url)
        doc = Nokogiri::HTML(uri_double.open(url))
        puts doc
      end
      it "should parsing crypto curencies data"
      
    end 

   




