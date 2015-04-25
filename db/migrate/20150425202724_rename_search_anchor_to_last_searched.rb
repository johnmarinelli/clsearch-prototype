class RenameSearchAnchorToLastSearched < ActiveRecord::Migration
  def change
    rename_column :queries, :search_anchor, :last_searched
  end
end
