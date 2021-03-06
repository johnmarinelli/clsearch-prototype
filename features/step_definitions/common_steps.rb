Given(/^(?:she|the user) is on (?:her|the) ([^"]*) page?$/) do |page|
  Common::actions.direct_pages page
end

When(/^she clicks on ([^"]*)$/) do |clicked_on|
  Common::actions.click_on clicked_on
end

When(/^the (.*) is disabled$/) do |element|
  Common::expectations.element_has_disabled_status element, true
end

When(/^the (.*) is enabled$/) do |element|
  Common::expectations.element_has_disabled_status element, false
end

Then(/^she sees her ([^"]*)$/) do |page|
  Common::expectations.sees_page? page
end

When(/^she fills out the (edit profile|bottom registration|top registration|login) form with the following information$/) do |form, creds|
  Common::actions.fill_in_form form, creds
end

Given(/^that (?:she|the user) (is|is not) logged in$/) do |logged_in|
  if logged_in == 'is not'
    Common::actions.logout
  end
end

Then(/^she doesn't do anything$/) do
end

