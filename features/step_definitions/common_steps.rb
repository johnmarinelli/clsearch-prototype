Given(/^she is on the ([^"]*) page$/) do |page|
  Common::actions.direct_pages page
end

When(/^she clicks on ([^"]*)$/) do |clicked_on|
  Common::actions.click_on clicked_on
end

Then(/^she sees her ([^"]*)$/) do |page|
  Common::expectations.sees_page? page
end
