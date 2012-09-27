class Category < ActiveRecord::Base
  attr_accessible :page_type, :cat_id, :description, :disclaimer, :name
  
  has_many :assignments, primary_key: :cat_id, foreign_key: :cat_id
  has_many :products, through: :assignments
  
  validates :cat_id, presence: true
  
  def self.refresh_data!(source)
    require 'open-uri'
    # Delete all existing Product data
    Category.destroy_all
    Assignment.destroy_all
    
    # Determine if source is url or XML file
    if source =~ /^https?:\/\//
      doc = Nokogiri::XML(source)
    else
      f = File.open(source)
      doc = Nokogiri::XML(f)
      f.close
    end

    # Source determined from Product refresh method
    doc.xpath('data/categories/category').each do |category|
  
      Category.create page_type:          category.xpath('attribute::pageType').inner_text.present? ? category.xpath('attribute::pageType').inner_text : nil,
                      cat_id:             category.xpath('id').inner_text,
                      description:        category.xpath('description').inner_text,    
                      name:               category.xpath('name').inner_text, 
                      disclaimer:         category.xpath('disclaimer').inner_text
    end
    
    # Parse for assignments table
    doc.xpath('data/categories/category').each do |category|
    
      category.xpath('products/product').each do |product|
        
        Assignment.create cat_id:         category.xpath('id').inner_text,
                          origin_id:      product.xpath('id').inner_text
      end
    end  
  end                                                                               
end
