module QueryHelper
  def get_error_message(query, key)
    @query.nil? ? '' : @query.errors[key][0]
  end

  def retrieve_original_location_zipcode(zipcode)
    Reference::LocationReference.get_short_name_from_zipcode_code(zipcode) || zipcode
  end

  def retrieve_original_location_city(city)
    Reference::LocationReference.get_short_name_from_city_code(city) || city
  end

  def retrieve_original_location(query)
    return if query.location.nil?

    location = query.location['zipcode'] || query.location['city']
    if location.match(/\d{5}/).nil?
      retrieve_original_location_city location
    else
      retrieve_original_location_zipcode location
    end unless location.nil? 
  end

  def transform_heading(heading)
    heading.join ', ' unless heading.nil?
  end

  def get_query(resource)
    resource.queries[0] 
  end

  def get_heading(resource)
    get_query(resource).heading
  end
end
