Feature: As a registered user
  in order to feel smug
  I should have access to parts of the site non-registered users cannot access

Background:
  Given the following users exist:
  | name   | email           |
  | Anna   | anna@random.com |

Scenario: I visit a part of the site only authorized users can access
  Given I am logged in
  And I am on the "home" page
  When I click the "see private information" link
  Then I should be on the "private information" page
  And I should see "you are authorized to be here!"

Scenario: Trying to visit the protected site when not logged in
  Given I am not logged in
  And I am on the "home" page
  Then I should not see "see private information"
  When I try to visit the "private information" page
  Then I should be on the "home" page
  And I should see "You are not authorized to access that page"
