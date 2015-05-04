require 'capybara'

module Common
  class Expectations
    def sees_page?(page_name)
      case page_name
      when 'HOME'
      when 'DASHBOARD'
        raise Exception unless Common::session.has_content? 'Signed in successfully.'
      end
    end
  end

  @@expectations = Expectations.new

  def self.expectations
    @@expectations
  end
end

World(Common)
