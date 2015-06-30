Then(/^she sees a popup with a message confirming her new query$/) do
  Queries::expectations.has_confirmed_message_in_popup
end
