namespace :heroku_tasks do
  desc "test heroku scheduler is working"
  task test_output_to_log: :environment do
    puts Time.now
  end
end
