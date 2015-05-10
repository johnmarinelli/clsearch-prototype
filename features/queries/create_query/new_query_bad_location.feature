Feature: New query with bad input gives an error message
  As the product owner
  I want the user to be notified when they give invalid input

  Scenario Outline: User gives bad information
    Given she is on the DASHBOARD page
    And she clicks on NEW QUERY
    When she enters <Title> for title
    And <Keywords> for keywords
    And <City or zip code> for location
    And <Radius> for distance
    And <Price min> for price min
    And <Price max> for price max
    And <Frequency> for frequency of delivery
    Then she will get an error message saying <Error>
    Examples:
      | Title | Keywords | Category | City or zip code | Radius | Price min | Price Max | Frequency | Error    |
      | q1    | a, b     | AAAA     | 9180             | 5      | 0         | 100       | daily     | Bad zip  | 
      | q2    | c, d     | CCCC     | anahei           | 5      | 1         | 10        | weekly    | Bad city |

