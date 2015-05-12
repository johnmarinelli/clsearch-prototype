When(/^she enters (.*) for title$/) do |title|
  Queries::actions.fill_in_title_field title
end

When(/^(.*) for keywords$/) do |keywords|
  Queries::actions.fill_in_keywords keywords
end

When(/^(.*) for category$/) do |category|
  Queries::actions.fill_in_category category
end

When(/^(.*) for location$/) do |location|
  Queries::actions.fill_in_location location
end

When(/^(.*) for distance$/) do |distance|
  Queries::actions.fill_in_distance distance
end

When(/^(.*) for price min$/) do |price_min|
  Queries::actions.fill_in_price_min price_min
end

When(/^(.*) for price max$/) do |price_max|
  Queries::actions.fill_in_price_max price_max
end

When(/^(.*) for frequency of delivery$/) do |frequency|
  Queries::actions.fill_in_frequency frequency
end

When(/^she submits the query$/) do
  #Queries::actions.submit_query
end

Then(/^she will get an error message saying (.*)$/) do |error|
  Queries::expectations.has_error_message error
end
