Feature: Candidates List
  In order to get employees
  As a job offerer
  I want to see candidate list of an offer

  Background:
    Given only a "Ruby Sr" offer exists in the offers list
    And a candidate has applied offer
    And I am logged in as job offerer

  Scenario: See one candidate
    Given I access the offers list page
    And I see "1" in My Offers
    And I access to see candidates
    Then I should see "Del Rio" in candidates page
