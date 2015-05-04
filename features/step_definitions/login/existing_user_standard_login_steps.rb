Given(/^that the user (is|is not) logged in$/) do |logged_in|
  if logged_in == 'is not'
    Login::actions.logout
  end
end

When(/^she fills out the login form with the following information$/) do |creds|
  Login::actions.fill_in_login_form creds
end
