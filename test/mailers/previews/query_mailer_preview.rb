# Preview all emails at http://localhost:3000/rails/mailers/query_mailer
class QueryMailerPreview < ActionMailer::Preview
  def sample
    user = User.first
    tts = Search::APISearch.new

    q = Query.new({
      :category_group => '',
      :location => {
        :zipcode => 'USA-85282'
      }.to_json,
      :radius => 10,
      :user_id => 1,
      :price_min => 0,
      :price_max => 100,
      :heading => ['xbox'].to_json,
      :title => 'Tempe xbox',
      :frequency => 'daily',
      :last_searched => Time.now - 2.weeks
    })

    tts.set_params q.attributes
    data = JSON.parse tts.search

    QueryMailer.query_mail user, data, true
  end
end
