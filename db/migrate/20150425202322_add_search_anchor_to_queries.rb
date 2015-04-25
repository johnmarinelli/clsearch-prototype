class AddSearchAnchorToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :search_anchor, :timestamp
  end
end
