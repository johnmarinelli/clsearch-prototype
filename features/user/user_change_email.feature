Feature: Existing user changes their email.
  As the product owner
  I want users to be able to change their email.

  Background: User just landed on the site
    Given that the user is not logged in 
    And she is on the HOME page

  Scenario: User logs in
    When she clicks on LOGIN
    Then she fills out the login form with the following information
      | Email    | test@email.com  |
      | Password | password        |
    And she sees her DASHBOARD
    When she clicks on EDIT PROFILE INFORMATION 
    Then she fills out the edit profile form with the following information
      | Email                         | test100@email.com |
      | Current password              | password          |
    And she clicks on UPDATE
    Then she sees a popup confirming her change


