require 'capybara'

module Login
  include Common

  class LoginActions < Common::Actions
    def login(email='test@example.com', password='password')
      user = User.new({ :email => email, :password => password })
      user.skip_confirmation!
      user.save!

      puts user.inspect

      Login::session.find(:css, '#user_email').set email
      Login::session.find(:css, '#user_password').set password
      Login::session.click_button 'Log in'
    end

    def logout
    end
    
    def fill_in_login_form(credentials)
      # TODO: get values from cucumber ast table
      puts credentials.inspect

      login
    end
  end

  @@session = Capybara::Session.new(:selenium)
  Capybara.app_host = 'http://localhost:3000'

  def self.session
    @@session
  end

  @@actions = LoginActions.new

  def self.actions
    @@actions
  end
end

World(Login)
