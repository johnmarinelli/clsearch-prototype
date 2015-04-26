class AddIndexToZipcodeReferences < ActiveRecord::Migration
  def change
    add_index :zipcode_references, :full_name
    add_index :zipcode_references, :short_name
  end
end
