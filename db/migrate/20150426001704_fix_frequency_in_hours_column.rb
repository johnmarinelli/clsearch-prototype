class FixFrequencyInHoursColumn < ActiveRecord::Migration
  def change
    change_column :queries, :frequency_in_hours, :string
    rename_column :queries, :frequency_in_hours, :frequency
  end
end
