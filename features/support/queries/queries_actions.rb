require 'capybara'

module Queries
  include Common

  class QueryActions < Common::Actions
    def fill_in_title_field(title)
      Common::session.find(:css, '#title').set title
    end

    def fill_in_keywords(keywords)
      Common::session.find(:css, '#keywords').set keywords
    end

    def fill_in_category(category)
      Common::session.select(category, :from => 'category')
    end

    def fill_in_location(location)
      Common::session.find(:css, '#location-primary').set location
    end

    def fill_in_distance(distance)
      Common::session.select(distance, :from => 'radius')
    end

    def fill_in_price_min(price_min)
      Common::session.find(:css, '#price_min').set price_min
    end

    def fill_in_price_max(price_max)
      Common::session.find(:css, '#price_max').set price_max
    end

    def fill_in_frequency(frequency)
      Common::session.choose frequency.capitalize
    end

    def submit_query
      Common::session.click_on 'Save Query'
    end
  end

  @@query_actions = QueryActions.new

  def self.actions
    @@query_actions
  end
end

World(Queries)
