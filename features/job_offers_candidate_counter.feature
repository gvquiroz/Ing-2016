Feature: Job Offer Candidates Counter
  In order to see which of my offers has more applicants
  As a offerer
  I want to see how many candidates have applied an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: I see zero candidates when no candidate has applied
    Given I access the offers list page
    And a candidate click apply
    When I access the offers list page
    Then I should see "0" in My Offers

  Scenario: I see how many candidates applied on an offer
    Given I access the offers list page
    And a candidate click apply
    And I access the offers list page
    And a candidate click apply
    Given the candidate form is filled with "candidate@email.com"
    And candidate confirm job application
    When I access the offers list page
    Then I should see "1" in My Offers
