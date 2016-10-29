Feature: Activate Job Offer
  In order to get employees
  As a job offerer
  I want to activate an offer for a month

  Background:
  	Given I am logged in as job offerer

  Scenario: Activate an offer for a month
    Given a offer has is active in "false"
    Given Today's date "2016-11-11"
    When I activate
    Then I should see the new date "2016-12-11" in My Offers
