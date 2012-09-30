ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span "Welcome to Cardinform Administration Section"
        small "Please use links below to update poduct database"
        strong { link_to "Refresh Products", refresh_data_products_path, confirm: "Warning! Are you sure?  This will delete all products.", method: :post } 
        strong { link_to "Refresh Categories", refresh_data_categories_path, 
  				confirm: "Warning! This process will delete all existing categories and replace them with the latest provider data. It cannot be reversed. Are you sure you want to continue?", method: :post }
      
      end
    end


columns do
  column do
      section "Featured Products" do
        table_for Product.where("feature_flag = ?", true) do |t|
          t.column :name do |product|
            link_to product.name, [:edit_admin, product]
          end
          t.column :issuer
        end # table_for
      end # section    
  end # column
    
  column do
      section "Popular Products" do
        table_for Product.where("popular_flag = ?", true) do |t|
          t.column :name do |product|
            link_to product.name, [:edit_admin, product]
          end
          t.column :issuer
        end # table_for
      end # section    
  end # column  
    
  column do
      section "Low Apr Feature Products" do
        table_for Product.where("low_apr_feature_flag = ?", true) do |t|
          t.column :name do |product|
            link_to product.name, [:edit_admin, product]
          end
          t.column :issuer
        end # table_for
      end # section    
  end # column   
end # columns 
    
columns do   
  
  column do
      section "Rewards Products" do
        table_for Product.where("rewards_feature_flag = ?", true) do |t|
          t.column :name do |product|
            link_to product.name, [:edit_admin, product]
          end
          t.column :issuer
        end # table_for
      end # section    
  end # column
  
  column do
      section "Business Feature Products" do
        table_for Product.where("business_feature_flag = ?", true) do |t|
          t.column :name do |product|
            link_to product.name, [:edit_admin, product]
          end
          t.column :issuer
        end # table_for
      end # section    
  end # column
     
  column do
    section "Bad Credit Feature Products" do
      table_for Product.where("bad_credit_feature_flag = ?", true) do |t|
        t.column :name do |product|
          link_to product.name, [:edit_admin, product]
        end
        t.column :issuer
      end
    end    
  end
end # columns

    
    section "Student Feature Products" do
      table_for Product.where("student_feature_flag = ?", true) do |t|
        t.column :name
        t.column :issuer
      end
    end    
             
          
    panel "Most recent products" do
      ul do
        Product.order("last_updated DESC").limit(5) do |product|
          li link_to(product.name, admin_product_path[:id])
        end
      end
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
