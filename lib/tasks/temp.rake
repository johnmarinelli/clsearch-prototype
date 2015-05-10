namespace :temp do
  desc "Deletes last user"
  task delete_last_user: :environment do
    User.last.destroy
  end
end
