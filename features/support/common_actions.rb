require 'capybara'

module Common
  class Actions
    include Devise::TestHelpers 

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
      when 'HOME'
        go_to_home
      end
    end

    def click_on(target)
      case target
      when /login/i
        Common::session.visit '/login'
      when /register/i
        Common::session.visit '/users/sign_up'
      else 
        puts "Couldn\'t find click_on #{target}"
      end
    end

    def fill_in_form(form, creds)
      case form
      when /registration/i
        Registration::actions.fill_in_registration_form creds
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
