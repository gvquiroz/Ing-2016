Feature: Job Offers Due Date
  In order to get employees
  As a job offerer
  I want to manage my offers

  Background:
  	Given I am logged in as job offerer

  Scenario: Create new offer with Due Date
    Given I access the new offer page
    When I fill the title with "Ruby vacancy"
    And I fill the location with "Nuñez"
    And I fill the Due Date "2016-11-11"
		And confirm the new offer
    Then I should see "Offer created"
    And I should see "2016-11-11" in My Offers
