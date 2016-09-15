Feature: Home page links

Background:

  Given the following users exist:
    | name    | email            |
    | Hanna 2  | hanna2@random.com |


  And the following articles exist:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |


Scenario: Seeing front-page bits
  Given I am logged in as "hanna@random.com"
  When I visit the "home" page
  Then I should see "Logout"
  And I should see "Current Articles"
  And I should see "One"
  And I should see "Two"
  And I should see "Three"
