class AddKeywordsToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :keywords, :json
  end
end
