Then(/^she sees a blurb with an error message for (.*) saying "(.*)"$/) do |error_for, msg|
  Registration::expectations.has_error_message error_for, msg
end

When(/^she fills out the top registration form with an existing email$/) do |creds|
  Registration::actions.fill_in_top_registration_form creds, false
end

