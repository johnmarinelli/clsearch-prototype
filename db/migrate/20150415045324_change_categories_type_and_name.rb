class ChangeCategoriesTypeAndName < ActiveRecord::Migration
  def change
    change_column :queries, :categories, :string
    rename_column :queries, :categories, :category
  end
end
