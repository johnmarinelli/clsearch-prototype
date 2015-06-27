Then(/^she sees a blurb with an error message saying "(.*)"$/) do |msg|
  Registration::expectations.has_error_message msg
end

