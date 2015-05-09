require 'capybara'

module Registration
  include Common

  class RegistrationActions < Common::Actions
    def register(email, password='password')
      Common::session.find(:css, '#user_email').set email
      Common::session.find(:css, '#user_password').set password
      Common::session.find(:css, '#user_password_confirmation').set password
      Common::session.click_button 'Sign up'
    end

    def fill_in_registration_form(credentials)
      # TODO: get values from cucumber ast table
      register 'test4@email.com'
    end
  end

  @@registration_actions = RegistrationActions.new

  def self.actions
    @@registration_actions
  end
end

World(Registration)
