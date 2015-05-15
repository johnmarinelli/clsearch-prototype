require 'capybara'

module Common
  class Expectations
    def sees_page?(page_name)
      case page_name
      when 'HOME'
      when 'DASHBOARD'
        raise Exception unless Common::session.has_content? 'Sign out'
      end
    end

    def element_is_disabled(element)
      case element
      when /save button/i
        Common::session.has_button? 'Save Query', disabled: true
      end
    end

    def element_has_disabled_status(element, status)
      case element
      when /save button/i
        Common::session.has_button? 'Save Query', disabled: status
      end
    end
  end

  @@expectations = Expectations.new

  def self.expectations
    @@expectations
  end
end

World(Common)
