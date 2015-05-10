Feature: New user registration
  As the product owner
  I want the new user registration process to be simple.

  Background: Just landed on the site
    Given that the user is not logged in
    And that the user is not registered
    And she is on the HOME page

  Scenario: User registers
    When she clicks on REGISTER
    Then she fills out the registration form with the following information
      | Email    | test4@email.com |
      | Password | password        |
    And she sees the HOME page with a message confirming her subscription
    When she confirms her registration
    Then she clicks on LOGIN
    And she fills out the login form with the following information
      | Email    | test4@email.com |
      | Password | password        |
    And she sees her DASHBOARD
