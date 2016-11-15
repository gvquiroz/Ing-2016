Feature: More job info in Apply
In order to get a job
As a candidate
I want to see more information supply when I apply to an offer

Background:
  Given I am logged in as job offerer

  Scenario: Apply to job offer

    Given I access the new offer page
    When I fill the title with "Ruby vacancy"
    And I fill the location with "Nuñez"
    And I fill the description with "You must have strong knowledge of Padrino and Rails"
    And I fill the Due Date "2017-12-25"
    And confirm the new offer
    And I access the offers list page
    And a candidate click apply
    And candidate click moreInfo button
    Then I should see "Ruby vacancy"
    And I should see "Nuñez"
    Then I should see "You must have strong knowledge of Padrino and Rails"
