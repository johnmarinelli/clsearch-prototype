Feature: New user registration
  As the product owner
  I want the new user registration process to be simple.

  Background: Just landed on the site
    Given that the user is not logged in
    And that the user is not registered
    And she is on the HOME page

  Scenario: User registers with email only
    When she clicks on REGISTER
    Then she fills out the top registration form with the following information
      | Email    | test6@email.com |
    When she clicks on SUBMIT
    Then she sees a popup with a message confirming her subscription

  Scenario: User registers with email and queries
    When she clicks on REGISTER
    Then she fills out the bottom registration form with the following information
      | Title     | My search       |
      | Keywords  | xbox            |
      | Category  | Uncategorized   |
      | Location  | 85282           |
      | Radius    | 5               |
      | Price min | 0               |
      | Price max | 150             |
      | Frequency | Daily           |
      | Email     | test6@email.com |
    When she clicks on SIGN UP
    Then she sees a popup with a message confirming her subscription
