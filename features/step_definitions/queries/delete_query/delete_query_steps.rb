Then(/^a confirmation window pops up and she clicks OKAY$/) do 
  Common::actions.click_on_javascript_popup_okay
end

Then(/^she sees a popup with a message confirming her deleted query$/) do
  Queries::expectations.has_confirmed_deletion_message_in_popup
end
