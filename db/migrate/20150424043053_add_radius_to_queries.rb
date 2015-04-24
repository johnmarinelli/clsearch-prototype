class AddRadiusToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :radius, :string
  end
end
