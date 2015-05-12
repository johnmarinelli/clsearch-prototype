Feature: Create a new query
  As the product owner

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
    When she submits the query
    Then she is on the DASHBOARD page
    Examples:
      | Title | Keywords | Category | City or zip code | Radius | Price min | Price max | Frequency | 
      | q1    | a, b     | Animals  | 92808            | 5      | 0         | 100       | Daily     |

