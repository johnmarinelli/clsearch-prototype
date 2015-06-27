Then(/^she sees a popup confirming her change$/) do
  UserProfile::expectations.has_change_confirmed_message_in_popup
end

