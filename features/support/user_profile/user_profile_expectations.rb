require 'capybara'

module UserProfile
  include Common

  class UserProfileExpectations < Common::Expectations
    def has_change_confirmed_message_in_popup
      elem = Common::session.first '#flash-notice'
      str = /updated/
      puts elem.text
      raise Exception if (str =~ elem.text).nil?
    end
  end

  @@user_expectations = UserProfileExpectations.new

  def self.expectations
    @@user_expectations
  end
end

