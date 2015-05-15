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
    When she clicks on SIGN UP
    Then she sees her DASHBOARD
