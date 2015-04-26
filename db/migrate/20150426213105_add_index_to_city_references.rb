class AddIndexToCityReferences < ActiveRecord::Migration
  def change
    add_index :city_references, :full_name
    add_index :city_references, :short_name
  end
end
