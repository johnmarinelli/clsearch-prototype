class AddPriceMinAndPriceMaxToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :price_min, :int
    add_column :queries, :price_max, :int
  end
end
