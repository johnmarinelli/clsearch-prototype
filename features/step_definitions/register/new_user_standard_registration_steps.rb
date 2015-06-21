Given(/^that the user (is|is not) registered$/) do |registered|
end

Then(/^she sees a popup with a message confirming her subscription$/) do
  Registration::expectations.has_confirmed_message_in_popup
end

When(/^she confirms her registration$/) do
  Registration::actions.confirm_last_registration
end

