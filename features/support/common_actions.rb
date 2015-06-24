require 'capybara'

module Common
  class Actions
    include Devise::TestHelpers 
    include Warden::Test::Helpers

    def go_to_home
      Common::session.visit '/'
    end

    def go_to_page(url)
      if url[0] != '/'
        url.prepend '/'
      end
      Common::session.visit url
    end

    def direct_pages(page)
      case page
      when /home/i 
        go_to_home
      when /dashboard/i
        if Common::session.has_content? 'Login'
          go_to_page 'login'
          Login::actions.login
        else
          go_to_home
        end
      end
    end

    def click_on(target)
      case target
      when /login/i
        Common::session.visit '/login'
      when /register/i
        Common::session.visit '/users/sign_up'
      when /sign up/i
        Common::session.click_button 'Sign up'
      when /new query/i
        Common::session.visit '/queries/new'
      when /submit/i
        Common::session.click_button 'Submit'
      when /delete query/i
        Queries::actions.click_on target
      else 
        puts "Couldn\'t find click_on #{target}"
      end
    end

    def fill_in_form(form, creds)
      case form
      when /top registration/i
        Registration::actions.fill_in_top_registration_form creds
      when /bottom registration/i
        Registration::actions.fill_in_bottom_registration_form creds
      when /login/i
        Login::actions.fill_in_login_form creds
      else 
        puts "Couldn\'t find fill_in_form#{target}"
      end
    end

    def logout
      Common::session.visit '/'
      begin
        Common::session.click_on 'Sign out'
      rescue
      end
    end
  end

  @@session = Capybara::Session.new(:selenium)
  Capybara.app_host = 'http://localhost:3000'

  def self.session
    @@session
  end

  @@actions = Actions.new

  def self.actions
    @@actions
  end
end

World(Common)
