class Product < ActiveRecord::Base
  attr_accessible :name, :origin_id
  
  validates :origin_id, presence: true

  # Refresh the data in the Product table
  def self.refresh_data!(source)
    require 'open-uri'
    # Delete all existing Product data
    Product.destroy_all
    
    # Determine if source is url or XML file
    if source =~ /^https?:\/\//
      doc = Nokogiri::XML(source)
    else
      f = File.open(source)
      doc = Nokogiri::XML(f)
      f.close
    end
    
    # Parse all products
    doc.xpath('data/products/product').each do |product|
      
      Product.create  origin_id: product.xpath('id').inner_text,
                      name: product.xpath('name').inner_text
    end
  end

end  