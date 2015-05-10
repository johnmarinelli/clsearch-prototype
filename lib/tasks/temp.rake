namespace :temp do
  desc "Deletes last user"
  task delete_last_user: :environment do
    User.last.destroy
  end

  desc "Run single feature"
  task single_feature: :environment do
    file = ENV['file']
    exec "rake cucumber FEATURE=#{file} REQUIRE=features"
  end
end
