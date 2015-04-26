class CreateCityReferences < ActiveRecord::Migration
  def change
    create_table :city_references do |t|
      t.string :code
      t.string :full_name
      t.string :short_name

      t.timestamps null: false
    end
  end
end
