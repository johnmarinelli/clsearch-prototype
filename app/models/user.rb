class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :email, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable

  has_many :queries

  def has_queries?
    queries.length > 0
  end
  
  def do_scheduled_query
    queries = self.queries
    tts = Search::APISearch.new

    queries.each do |q|
      tts.set_params q.attributes
      data = JSON.parse tts.search
      QueryMailer.query_mail(self, data).deliver
    end
  end
end
