class AddFeatureFlagsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :feature_flag,            :boolean, default: false
    add_column :products, :popular_flag,            :boolean, default: false
    add_column :products, :low_apr_feature_flag,    :boolean, default: false
    add_column :products, :rewards_feature_flag,    :boolean, default: false
    add_column :products, :business_feature_flag,   :boolean, default: false
    add_column :products, :bad_credit_feature_flag, :boolean, default: false
    add_column :products, :student_feature_flag,    :boolean, default: false
  end
  
  def self.down                                    
    drop_column :products, :feature_flag
    drop_column :products, :popular_flag
    drop_column :products, :low_apr_feature_flag
    drop_column :products, :rewards_feature_flag
    drop_column :products, :business_feature_flag
    drop_column :products, :bad_credit_feature_flag
    drop_column :products, :student_feature_flag
  end                                                 
end                                                
