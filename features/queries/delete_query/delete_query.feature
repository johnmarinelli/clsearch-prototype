Feature: Delete a query from dashboard
  As the product owner
  I want the user to be able to delete a query

  Background: User just landed on the site
    Given that the user is not logged in 
    And she is on the HOME page
    When she clicks on LOGIN
    Then she fills out the login form with the following information
      | Email    | test@email.com  |
      | Password | password        |

  Scenario: User deletes a query
    Given she is on the DASHBOARD page
    When she clicks on DELETE QUERY
    Then a confirmation window pops up and she clicks OKAY
    Then she sees her DASHBOARD
    And she sees a popup with a message confirming her deleted query

