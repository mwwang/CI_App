class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :origin_id
      t.integer :cat_id

      t.timestamps
    end
    
    add_index :assignments, :origin_id
    add_index :assignments, :cat_id
  end
end
