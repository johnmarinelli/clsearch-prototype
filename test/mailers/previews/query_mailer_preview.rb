# Preview all emails at http://localhost:3000/rails/mailers/query_mailer
class QueryMailerPreview < ActionMailer::Preview
  def sample
    user = User.first
    tts = Search::APISearch.new
    data = JSON.parse tts.search 

    QueryMailer.query_mail user, data
  end
end
