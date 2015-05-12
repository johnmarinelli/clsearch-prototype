Feature: New query with bad input gives an error message
  As the product owner
  I want the user to be notified when they give invalid input

  Scenario Outline: User gives bad location information
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
    And she will get an error message saying <Error>
    And the SAVE BUTTON is disabled
    Examples:
      | Title | Keywords | Category | City or zip code | Radius | Price min | Price max | Frequency | Error    |
      | q1    | a, b     | Animals  | 9180             | 5      | 0         | 100       | Daily     | bad city |
      | q2    | c, d     | Community| anahei           | 5      | 1         | 20        | Weekly    | bad city |

