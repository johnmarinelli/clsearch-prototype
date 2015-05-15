require 'capybara'

module Queries
  include Common

  class QueryExpectations < Common::Expectations
    def has_error_message(error)
      raise Exception unless Common::session.has_content? error
    end

    def query_count_incremented
      true
    end
  end

  @@query_expectations = QueryExpectations.new

  def self.expectations
    @@query_expectations
  end
end

