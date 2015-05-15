require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
    def register(email, password='password')
      Common::session.find(:css, '#user_email').set email
      Common::session.find(:css, '#user_password').set password
      Common::session.find(:css, '#user_password_confirmation').set password
    end

    def fill_in_registration_form(credentials)
      rows = credentials.rows_hash
      email = rows['Email']
      password = rows['Password']

      register email, password
    end

    def confirm_last_registration
      User.last.confirm!
      User.last.confirmed_at = Time.now
      User.last.save!
    end
  end

  @@registration_actions = RegistrationActions.new

  def self.actions
    @@registration_actions
  end
end

World(Registration)
