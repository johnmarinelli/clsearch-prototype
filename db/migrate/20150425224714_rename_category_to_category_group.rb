class RenameCategoryToCategoryGroup < ActiveRecord::Migration
  def change
    rename_column :queries, :category, :category_group
  end
end
