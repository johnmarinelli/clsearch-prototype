class CreateZipcodeReferences < ActiveRecord::Migration
  def change
    create_table :zipcode_references do |t|
      t.string :code
      t.string :full_name
      t.string :short_name

      t.timestamps null: false
    end
  end
end
