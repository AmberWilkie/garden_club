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
  When I log out as "Anna"
  And I visit the "private information" page
  Then I should be on the "home" page
  And I should see "You are not authorized to access that page"
