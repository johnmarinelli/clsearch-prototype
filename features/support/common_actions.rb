require 'capybara'

module Common
  @@session = Capybara::Session.new(:selenium)

  class Actions
    def go_to_home
      @@session.visit 'http://localhost:3000'
    end
  end
end
