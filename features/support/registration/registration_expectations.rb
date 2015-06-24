require 'capybara'

module Registration
  include Common

  class RegistrationExpectations < Common::Expectations
    def has_confirmed_message_in_popup
      elem = Common::session.find '#flash-notice'
      str = /email has been sent to your address/
      raise Exception if (str =~ elem.text).nil?
    end
  end

  @@registration_expectations = RegistrationExpectations.new

  def self.expectations
    @@registration_expectations
  end
end

