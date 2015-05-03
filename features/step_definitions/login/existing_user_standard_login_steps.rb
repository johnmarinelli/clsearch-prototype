Given(/^that the user (is|is not) logged in$/) do |logged_in|
  if logged_in == 'is not'
    Common::actions.log_in
  end
end
