Feature: Existing user login 
  As the product owner
  The login had better work

  Background: User just landed on the site
    Given that the user is not logged in 
    And she is on the HOME page

  Scenario: User logs in
    When she clicks on LOGIN
