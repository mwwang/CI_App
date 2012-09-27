class AddCatIdIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, :cat_id
  end
end
