module Search
  class QueryRunner
    def self.send_emails
      users = User.all

      users.each do |user|
        user.do_scheduled_queries
      end
    end
  end
end
