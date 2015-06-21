require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
    def register(email)
      Common::session.first(:css, '#user_email').set email
    end

    def fill_in_registration_form(credentials)
      rows = credentials.rows_hash
      email = rows['Email']

      register email
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
