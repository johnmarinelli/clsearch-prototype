class Query < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :category_group, :frequency

end
