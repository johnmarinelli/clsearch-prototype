require 'capybara'

module Registration
  include Common

  class RegistrationExpectations < Common::Expectations
    def has_confirmed_message_in_popup
      elem = Common::session.first '#flash-notice'
      str = /sent to your email address/
      raise Exception if (str =~ elem.text).nil?
    end
  end

  @@registration_expectations = RegistrationExpectations.new

  def self.expectations
    @@registration_expectations
  end
end

