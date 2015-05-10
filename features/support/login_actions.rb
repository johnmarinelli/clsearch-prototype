require 'capybara'

module Login
  include Common

  class LoginActions < Common::Actions
    def login(email='test@email.com', password='password')
      Common::session.find(:css, '#user_email').set email
      Common::session.find(:css, '#user_password').set password
      Common::session.click_button 'Log in'
    end
    
    def fill_in_login_form(credentials)
      rows = credentials.rows_hash
      email = rows['Email']
      password = rows['Password']

      login email, password
    end
  end

  @@login_actions = LoginActions.new

  def self.actions
    @@login_actions
  end
end

World(Login)
