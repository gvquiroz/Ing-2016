Feature: Job Offer Apply Counter
  In order to see wich of my offers has more applies
  As a offerer
  I want to see how many people applied to an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: I see how many users apply on an offer
    Given I access the offers list page
    And a candidate click apply
    When I access the offers list page
    And I should see "1" in My Offers
