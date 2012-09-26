Feature: Add post
  As a user
  In order to have discussions about a news article
  I should be able to post the link to the site

  Scenario: User is signed in
    Given I am a user who is signed in
    When I click on Submit
    Then I should see a form to post the link

    Given I see then form to submit link
    When I post the relevant details and click on submit
    Then I should see the post in the main page

  Scenario: User is not signed in
    Given I am a user who is not signed in
    When I click on submit
    Then I should be taken to the login page


