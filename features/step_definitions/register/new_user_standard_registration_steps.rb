Given(/^that the user (is|is not) registered$/) do |registered|
end

Then(/^she sees the HOME page with a message confirming her subscription$/) do
    Registration::expectations.has_confirmed_message
end

When(/^she confirms her registration$/) do
  Registration::actions.confirm_last_registration
end

