class RenameKeywordsToHeading < ActiveRecord::Migration
  def change
    rename_column :queries, :keywords, :heading
  end
end
