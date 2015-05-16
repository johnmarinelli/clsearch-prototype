class CreateCategoryGroupReferences < ActiveRecord::Migration
  def change
    create_table :category_group_references do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
