class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.bigint :anchor
      t.json :sources
      t.json :categories
      t.json :location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
