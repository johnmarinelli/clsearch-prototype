class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :email, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :queries, dependent: :destroy
  accepts_nested_attributes_for :queries

  def password_required?
    super if confirmed?
  end
   
  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def has_queries?
    queries.length > 0
  end

  def with_query
    self.queries.build if self.queries.empty?
    self
  end
  
  def do_scheduled_query
    queries = self.queries
    tts = Search::APISearch.new

    queries.each do |q|
      tts.set_params q.attributes
      data = JSON.parse tts.search

      first_time_searching = q.first_time_searching?
      q.handle_first_time_searching if first_time_searching

      QueryMailer.query_mail(self, data, first_time_searching).deliver_later

      q.last_searched = Time.now

      self.increment! :query_count
    end
  end
end
