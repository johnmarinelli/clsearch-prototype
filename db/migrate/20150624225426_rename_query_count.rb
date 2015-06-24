class RenameQueryCount < ActiveRecord::Migration
  def change
    rename_column :users, :query_count, :sent_query_count
  end
end
