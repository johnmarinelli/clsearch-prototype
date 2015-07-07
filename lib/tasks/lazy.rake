namespace :lazy do
  desc "Deletes last user"
  task delete_last_user: :environment do
    User.last.destroy
  end

  desc "send an email"
  task send_email: :environment do
    u = User.where(email: ENV['MY_EMAIL']).first
    q = u.queries.first
    tts = Search::APISearch.new
    tts.set_params q.attributes
    data = JSON.parse tts.search

    email = QueryMailer.query_mail(u, data, false, 'title').deliver_now
  end

end
