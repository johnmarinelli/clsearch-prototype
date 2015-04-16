class AddTitleToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :title, :string
  end
end
