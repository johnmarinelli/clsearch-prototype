module Search
  class Parameters
    attr_reader :params

    def initialize(params=nil)
      @params = {
        :anchor => 0,
        :sources => nil,
        :keywords => nil,
        :category => nil, 
        :location => nil, 
        :price_min => 0, 
        :price_max => 0, 
      }

      if not params.nil? 
        set_parameters params
      end
    end

    def set_parameter(k, v)
      if @params.has_key? k
        @params[k] = v
      else 
        p "Warning: '#{k}' isn\'t a valid key for API parameters.  It won\'t be used."
      end
    end
    
    def set_parameters(params)
      params.symbolize_keys!
      params.each do |k, v|
        set_parameter k, v
      end
    end
  end
end
