Feature: Bad new user registration
  As the product owner
  I want the registration process to handle errors properly

  Background: Just landed on the site
    Given that the user is not logged in
    And that the user is not registered
    And she is on the HOME page

  Scenario: User doesn't fill anything out
    When she clicks on REGISTER
    Then she doesn't do anything
    When she clicks on SUBMIT
    Then she sees a blurb with an error message for EMAIL saying "Email can't be blank"

  Scenario: User uses an already taken email address
    When she clicks on REGISTER
    Then she fills out the top registration form with an existing email
      | Email    | test@email.com |
    When she clicks on SUBMIT
    Then she sees a blurb with an error message for EMAIL saying "Email has already been taken"

  Scenario: User registers with email and invalid query data
    When she clicks on REGISTER
    Then she fills out the bottom registration form with the following information
      | Title     | My search       |
      | Keywords  | xbox            |
      | Category  | Uncategorized   |
      | Location  | 11              |
      | Radius    | 5               |
      | Price min | 0               |
      | Price max | 150             |
      | Frequency | Daily           |
      | Email     | test6@email.com |
    And she sees a blurb with an error message for LOCATION saying "We couldn't find that location!"
    And the SUBMIT button is disabled
