Feature: Apply
In order to get a job
as a candidate
I want to see information supply when I apply to an offer

Background:
  Given I am logged in as job offerer

  Scenario: Apply to job offer

    Given I access the new offer page
    When I fill the title with "Ruby vacancy"
    And I fill the location with "Nuñez"
    And I fill the Due Date "2017-11-11"
    And confirm the new offer
    And I access the offers list page
    And a candidate click apply
    Then I should see "Ruby vacancy in Nuñez"
