Feature: Create a new query
  As the product owner

  Background: User just landed on the site
    Given that the user is not logged in 
    And she is on the HOME page
    When she clicks on LOGIN
    Then she fills out the login form with the following information
      | Email    | test@email.com  |
      | Password | password        |

  Scenario Outline: User creates a query
    Given she is on the DASHBOARD page
    And she clicks on NEW QUERY
    And the SAVE BUTTON is disabled
    When she enters <Title> for title
    And <Keywords> for keywords
    And <Category> for category
    And <City or zip code> for location
    And <Radius> for distance
    And <Price min> for price min
    And <Price max> for price max
    And <Frequency> for frequency of delivery
    Then the SAVE BUTTON is enabled
    When she clicks on SAVE QUERY
    Then she sees a popup with a message confirming her new query
    Examples:
      | Title | Keywords | Category | City or zip code | Radius | Price min | Price max | Frequency | 
      | q1    | a, b     | Animals  | 92808            | 5      | 0         | 100       | Daily     |

