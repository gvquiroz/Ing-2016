Feature: Activate Job Offer
  In order to get employees
  As a job offerer
  I want to activate an offer for a month

  Background:
  	Given I am logged in as job offerer

  Scenario: Activate an offer for a month
    Given I access the new offer page
    When I fill the title with "Ruby vacancy"
    And I fill the location with "Palermo"
    And I fill the Due Date "2016-10-11"
    And confirm the new offer
    And I access the my offers page
    And I activate
    Then I you should see the new day with an extra month in My Offers
