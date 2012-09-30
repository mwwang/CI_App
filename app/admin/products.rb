ActiveAdmin.register Product do
  
  filter :issuer, as: :select
  filter :created_at
  
  sidebar :help do
    "Need help? Email us at help@example.com"
  end
  
  index do
    column :last_updated do |product|
      product.last_updated.to_date
    end
    column :created_at do |created|
      created.created_at.to_date
    end
    column :name do |product|
      link_to product.name, admin_product_path(product)
    end
    column :issuer
    default_actions
  end
  
  show do
    attributes_table do
      row :origin_id
      row :name do
        simple_format product.name
      end
      row :description do
        simple_format product.description
      end
      row :issuer
    end
    
    h3 "Associated Categories"
    table_for product.categories do |c|
      c.column "Type", :page_type
      c.column "Categories", :name
    end
  end
  
  
  
end
