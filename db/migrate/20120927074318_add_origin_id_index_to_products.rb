class AddOriginIdIndexToProducts < ActiveRecord::Migration
  def change
    add_index :products, :origin_id
  end
end
