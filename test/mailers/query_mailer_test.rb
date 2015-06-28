require 'test_helper'

class QueryMailerTest < ActionMailer::TestCase
  test "send query result " do
    q = queries :fifth
    tts = Search::APISearch.new
    tts.set_params q.attributes
    data = JSON.parse tts.search
    
    email = QueryMailer.query_mail(users(:four), data, false, q.title).deliver_now
  end
end
