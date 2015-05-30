module Search
  class Parameters
    @@special_keys = [:price_min, :price_max, :last_searched]

    attr_reader :params

    def initialize(params=nil)
      @params = {
        :anchor => nil,
        :sources => nil,
        :heading => nil,
        :category_group => nil, 
        :location => nil,
        :price => nil,
        :radius => 0,
        :timestamp => nil,
        :retvals => 'id,source,category,location,external_url,heading,timestamp,expires,body,price,images'
      }

      if not params.nil? 
        set_parameters params
      end
    end

    def set_parameter(k, v)
      # initial parameter object already has key.
      if @params.has_key? k
        @params[k] = v
      # key needs some special handling; for ex: :price_min, :price_max -> :price
      elsif key_is_special? k
        handle_special_key k, v
      # invalid key.  don't add it to parameter object.
      else 
        p "Warning: '#{k}' isn\'t a valid key for API parameters.  It won\'t be used."
      end
    end
    
    def set_parameters(params)
      params = params.symbolize_keys
      params.each do |k, v|
        if not v.nil?
          set_parameter k, v
        end
      end
    end

    def self.construct_parameters_from_input(params)
      # what
      title = params[:title]

      # assume keywords is a comma-separated list
      keywords = params[:heading].delete(' ').split(',')
      category_group = params[:category_group]

      # location
      primary_location = params[:location].strip

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
        :sources => Array([]).to_json,
        :heading => Array(keywords).to_json,
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

    private
    def key_is_special?(key)
      @@special_keys.include? key
    end

    def handle_special_key(key, value)
      # price special key
      if not key.to_s[/price/].nil?
        construct_price_string value, key
      # last searched special key
      elsif not key.to_s[/last_searched/].nil?
        construct_timestamp_string value
      end
    end

    # constructs 'n..M' from :price_min => n, :price_max => M
    def construct_price_string(value, price_sym)
      if price_sym == :price_min
        if @params[:price].nil?
          @params[:price] = value.to_s + '..'
        else
          @params[:price].prepend value.to_s
        end
      elsif price_sym == :price_max
        if @params[:price].nil?
          @params[:price] = '..' + value.to_s
        else
          @params[:price] += value.to_s
        end
      end
    end

    # constructs 'n..' from :search_anchor
    def construct_timestamp_string(value)
      # TODO: for testing purposes, comment this out
      #@params[:timestamp] = "#{value.to_i}.."
    end
  end
end
