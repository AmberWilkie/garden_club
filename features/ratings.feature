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

@javascript
Scenario: Amber rates Hanna's articles
  Given I am logged in as "amber@random.com"
  And I am on the article page for article "One"
  Then I should see "Rate this article"
  When I click on "4" stars
  # Then I should see "4" stars

Scenario: Visitors cannot rate articles
  Given I am not logged in
  And I am on the article page for article "One"
  Then I should see "One awesome text"
  And I should not see "Rate this article"

Scenario: Users can't rate their own articles
  Given I am logged in as "hanna@random.com"
  And I am on the article page for article "One"
  Then I should not see "Rate this article"

Scenario: View rating average of an article
  Given article "One" has a rating of "3.5"
  When I am on the article page for article "One"
  Then I should see "Average rating:"
  Then I should see "3.5" stars

Scenario: Viewing top rated articles on home page
  Given article "One" has a rating of "1"
  And article "Three" has a rating of "5"
  And I am on the "home" page
  Then I should see "Top rated articles"
  And I should see "Three One"
