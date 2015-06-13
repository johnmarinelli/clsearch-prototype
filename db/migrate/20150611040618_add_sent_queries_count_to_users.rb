class AddSentQueriesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :query_count, :integer, :default => 0
  end
end
