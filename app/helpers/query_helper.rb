module QueryHelper
  def get_error_message(query, key)
    @query.nil? ? '' : @query.errors[key][0]
  end

  def retrieve_original_location_input(zipcode)
    Reference::LocationReference.get_short_name_from_location_code(zipcode) || zipcode
  end
end
