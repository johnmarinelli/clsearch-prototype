require('open-uri')

# helper function to append get vars to the endpoint
def append_get_vars(url, args)
  if url[-1, 1] != '?' then
    url[-1, 1] << '?'
  end

  args.each do |k, v|
    # TODO
    # find way to recursively dive into a hash and build a url
    if not k.instance_of? Hash
      url << '&' << k.to_s << '=' << v.to_s
    end
  end

  url
end

module Search
  Api_key = ENV['API_KEY']

  # base class that will hold common search parameters, auth token
  class API
    attr_reader :api_url
    attr_reader :endpoint
    attr_reader :auth_token

    attr_reader :parameters

    def initialize(sub)
      @auth_token = Search::Api_key
      
      @parameters = Search::Parameters.new

      @api_url = "http://" + sub + ".3taps.com?"
      append_get_vars @api_url, {'auth_token' => @auth_token}
    end

    def status
      open(@api_url).status
    end

    def set_params(params)
      @parameters.set_parameters params
    end
  end

  # handles search endpoint for api
  class APISearch < API
    def initialize
      super('search')
    end

    def search
      @endpoint = append_get_vars @api_url.clone, @parameters.params
      open(@endpoint).read
    end
  end

  # handles poll endpoint for api
  class APIPoll < API
    def initialize(anchor=nil)
      super('polling')

      if nil != anchor
        append_get_vars @api_url, { :anchor => anchor }
      end

      # add /poll to end of url
      idx = @api_url.index('.com')
      @api_url.insert(idx+4, '/poll')
    end

    def set_anchor(anchor)
      @parameters.set_parameter(:anchor, anchor)
    end
  end

  class APIReference < API
    def initialize(param, level = '')
      super('reference')
      # add parameter to reference to end of url
      idx = @api_url.index('.com')
      @api_url.insert(idx+4, '/' + param)

      # only location parameter uses level right now (4/12/15)
      @endpoint = append_get_vars(@api_url.clone, { 
        :level => level
      })
    end

    def search
      open(@endpoint).read
    end
  end
end
