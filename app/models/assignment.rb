class Assignment < ActiveRecord::Base
  attr_accessible :cat_id, :origin_id
  
  belongs_to :product, primary_key: :origin_id, foreign_key: :origin_id
  belongs_to :category, primary_key: :cat_id, foreign_key: :cat_id
  
end
