class Query < ActiveRecord::Base
  belongs_to :user
  validates_with LocationValidator
  validates_presence_of :title, :category_group
  validates_presence_of :heading, :message => 'Keywords can\'t be blank'
  validates_presence_of :frequency, :message  => 'Fill this tf out'
end
