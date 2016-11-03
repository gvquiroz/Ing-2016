Feature: Activation notification
  In order to get employees
  As a job offerer
  I want to get an email notification when I activate an offer

  Background:
    Given I am logged in as job offerer

  Scenario: Receive mail after an offer is activated
    Given I access the new offer page
    When I fill the title with "Ruby Jr"
    And I fill the Due Date "2016-10-11"
    And confirm the new offer
    And I access the my offers page
    Then I should receive an email from "infojobvacancy2016@gmail.com"
    And I should see "Offer Reactivated" in the email subject
