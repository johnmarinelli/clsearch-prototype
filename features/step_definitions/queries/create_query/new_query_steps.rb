Then(/^her query count increases by one$/) do
  Queries::expectations.query_count_incremented
end
