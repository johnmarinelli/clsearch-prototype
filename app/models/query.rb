class Query < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :category_group, :frequency

  def self.construct_parameters_from_input(params)
    # what
    title = params[:title]

    # assume keywords is a comma-separated list
    keywords = params[:keywords].delete(' ').split(',')
    category_group = params[:category]

    # location
    primary_location = params[:location_primary].strip

    if primary_location.match(/^\d{5}$/).nil? 
      city = CityReference.find_city primary_location 
    else
      zipcode = ZipcodeReference.find_zipcode primary_location 
    end

    radius = params[:radius]

    # price
    price_min = params[:price_min]
    price_max = params[:price_max]

    # frequency
    frequency = params[:frequency]

    query_params = {
      :anchor => nil,
      :title => title,
      :sources => Array([]),
      :heading => Array(keywords),
      :category_group => category_group,
      :location => {
        :city => city || nil,
        :zipcode => zipcode || nil
      }.to_json,
      :price_min => price_min,
      :price_max => price_max,
      :frequency => frequency,
      :radius => radius,
      :last_searched => Time.now
    }
  end
end
