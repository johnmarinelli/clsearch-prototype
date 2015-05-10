require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
    def register(email, password='password')
      delete_user_if_exists email
      Common::session.find(:css, '#user_email').set email
      Common::session.find(:css, '#user_password').set password
      Common::session.find(:css, '#user_password_confirmation').set password
      Common::session.click_button 'Sign up'
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

    private
    def delete_user_if_exists(email)
      exists = User.find_by email: email

      unless exists.nil?
        exists.destroy
      end
    end
  end

  @@registration_actions = RegistrationActions.new

  def self.actions
    @@registration_actions
  end
end

World(Registration)
