require 'capybara'

module UserProfile
  include Common

  class UserProfileActions < Common::Actions
    def fill_in_edit_profile_form(form)
      rows = form.rows_hash
      email = rows['Email']
      password = rows['Current password']

      Common::session.find(:css, '#user_email').set email
      Common::session.find(:css, '#user_current_password').set password
    end
  end

  @@user_actions = UserProfileActions.new

  def self.actions
    @@user_actions
  end
end

World(UserProfile)
