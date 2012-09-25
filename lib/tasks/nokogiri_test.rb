require 'rubygems'
require 'nokogiri'
require 'open-uri'

# f = File.open("cardsynergy.xml")
# doc = Nokogiri::XML(doc)
# f.close


@doc = Nokogiri::XML(File.open("cardsynergy.xml"))

@doc.xpath("data/products/product").each do |node|
  origin_id = node.xpath("id").text
  name      =  node.xpath("name").text
  @product.create(origin_id: origin_id, name: name)
end


# xml_doc = Nokogiri::XML(open(doc))
