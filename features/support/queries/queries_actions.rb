require 'capybara'

module Queries
  include Common

  class QueryActions < Common::Actions
    def initialize 
      @query_params = {}
    end

    def fill_in_title_field(title)
      @query_params[:title] = title
      Common::session.find(:css, '#title').set title
    end

    def fill_in_keywords(keywords)
      @query_params[:heading] = keywords.split(', ')
      Common::session.find(:css, '#keywords').set keywords
    end

    def fill_in_category(category)
      @query_params[:category_group] = category
      Common::session.select(category, :from => 'category')
    end

    def fill_in_location(location)
      @query_params[:location] = {}
      if location.match(/^\d{5}$/).nil?
        @query_params[:location][:city] = location
      else
        @query_params[:location][:zipcode] = location
      end

      Common::session.find(:css, '#location-primary').set location
    end

    def fill_in_distance(distance)
      @query_params[:radius] = distance
      Common::session.select(distance, :from => 'radius')
    end

    def fill_in_price_min(price_min)
      @query_params[:price_min] = price_min
      Common::session.find(:css, '#price_min').set price_min
    end

    def fill_in_price_max(price_max)
      @query_params[:price_max] = price_max
      Common::session.find(:css, '#price_max').set price_max
    end

    def fill_in_frequency(frequency)
      @query_params[:frequency] = frequency
      Common::session.choose frequency.capitalize
    end

    def submit_query
      q = Query.create @query_params
      raise Exception 'Query parameters not formed correctly' unless q.valid?
    end

    def click_on(target)
      case target
      when /delete query/i
        Common::session.first(:link, 'Destroy').click
      end
    end
  end

  @@query_actions = QueryActions.new

  def self.actions
    @@query_actions
  end
end

World(Queries)
