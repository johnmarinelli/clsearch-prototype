class Query < ActiveRecord::Base
  belongs_to :user
  validates_with LocationValidator
  validates_presence_of :title, :category_group
  validates_presence_of :heading, :message => 'Keywords can\'t be blank'
  validates_presence_of :frequency, :message  => 'Please enter the frequency that you\'d like to receive emails at.'

  def first_time_searching?
    self.last_searched.nil?
  end

  def handle_first_time_searching
    # set first round of results to 2 weeks ago
    self.update :last_searched => DateTime.now - 2.weeks
  end
end
