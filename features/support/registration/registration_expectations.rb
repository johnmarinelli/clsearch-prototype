require 'capybara'

module Registration
  include Common

  class RegistrationExpectations < Common::Expectations
    def has_confirmed_message_in_popup
      elem = Common::session.first '#flash-notice'
      str = /sent to your email address/
      raise Exception if (str =~ elem.text).nil?
    end

    def has_error_message(error_for, msg)
      msg = /#{msg}/
      case error_for
      when /email/i
        elem = Common::session.first '#error_explanation'
        raise Exception if (msg =~ elem.text).nil?
      when /location/i
        elem = Common::session.first '#location-error'
        raise Exception if (msg =~ elem.text).nil?
      else
      end
    end

  end

  @@registration_expectations = RegistrationExpectations.new

  def self.expectations
    @@registration_expectations
  end
end

