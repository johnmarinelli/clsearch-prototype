module Search
  class Parameters
    @@special_keys = [:price_min, :price_max]

    attr_reader :params

    def initialize(params=nil)
      @params = {
        :anchor => 0,
        :sources => nil,
        :keywords => nil,
        :category => nil, 
        :location => nil,
        :price => nil,
        :radius => 0
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

    private
    def key_is_special?(key)
      @@special_keys.include? key
    end

    def handle_special_key(key, value)
      # price special key
      if not key.to_s[/price/].nil?
        construct_price_string value, key
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
  end
end
