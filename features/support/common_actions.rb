require 'capybara'

module Common
  class Actions
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
      when 'LOGIN'
        Common::session.visit '/login'
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
