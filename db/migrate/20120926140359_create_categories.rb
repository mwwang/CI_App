class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :page_type
      t.integer :cat_id
      t.string :name
      t.text :description
      t.text :disclaimer

      t.timestamps
    end
  end
end
