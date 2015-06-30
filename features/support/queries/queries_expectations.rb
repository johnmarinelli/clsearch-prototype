require 'capybara'

module Queries
  include Common

  class QueryExpectations < Common::Expectations
    def has_error_message(error)
      raise Exception unless Common::session.has_content? error
    end
    
    def has_confirmed_message_in_popup
      elem = Common::session.first '#flash-notice'
      str = /Successfully created/
      raise Exception if (str =~ elem.text).nil?
    end

  end

  @@query_expectations = QueryExpectations.new

  def self.expectations
    @@query_expectations
  end
end

