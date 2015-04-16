class AddFrequencyToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :frequency_in_hours, :int, :default => 24
  end
end
