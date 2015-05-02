Given(/^that the user (is|is not) registered$/) do |registered|
  
end

Given(/^she is on the ([^"]*) page$/) do |page|
  actions = Common::Actions.new 
  actions.go_to_home
end

When(/^she clicks on ([^"]*)$/) do |clicked_on|
end

