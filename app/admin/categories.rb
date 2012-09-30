ActiveAdmin.register Category do
  
  filter :page_type, as: :check_boxes
  filter :name, as: :select
  show do
    attributes_table do
       row :created_at
       row :cat_id
       row :page_type
       row :name do
         simple_format category.name
       end
     end
    h3 "Associated Products"
    table_for category.products do |p|
      p.column :name
      p.column "Issuer", :issuer
    end
  end
  
end
