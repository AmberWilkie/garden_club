Feature: As a user
  in order to rank articles
  I would like to be able to give each article a rating.

Background:
  Given the following users exist:
    | name  | email            |
    | Hanna | hanna@random.com |
    | Amber | amber@random.com |


  And "Hanna" has written the following articles:
    | title   | body             |
    | One     | One awesome text |
    | Two     | Two awesome text |
    | Three   | Three good texts |

Scenario: Amber rates Hanna's articles
  Given I am logged in as "amber@random.com"
  And I am on the article page for article "One"
  Then I should see "Rate this article"
