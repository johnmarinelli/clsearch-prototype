Given(/^that the user (is|is not) registered$/) do |registered|
  if registered == 'is'
    Common::actions.log_in
  end
end

