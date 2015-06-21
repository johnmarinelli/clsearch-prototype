Feature: New user registration
  As the product owner
  I want the new user registration process to be simple.

  Background: Just landed on the site
    Given that the user is not logged in
    And that the user is not registered
    And she is on the HOME page

  Scenario: User registers with email only
    When she clicks on REGISTER
    Then she fills out the registration form with the following information
      | Email    | test4@email.com |
    When she clicks on SUBMIT
    Then she sees a popup with a message confirming her subscription
