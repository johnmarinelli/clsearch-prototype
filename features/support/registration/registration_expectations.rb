require 'capybara'

module Registration
  include Common

  class RegistrationExpectations < Common::Expectations
    def has_confirmed_message_in_popup
      # TODO
      #raise Exception unless Common::session.has_content? 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
      raise Exception
    end
  end

  @@registration_expectations = RegistrationExpectations.new

  def self.expectations
    @@registration_expectations
  end
end

