class AddApiCodeIndicesToReferences < ActiveRecord::Migration
  def change
    add_index :zipcode_references, :code
    add_index :city_references, :code
  end
end
