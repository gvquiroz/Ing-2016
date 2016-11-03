Feature: Job Application
  In order to get a job
  As a candidate
  I want to apply to an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: Apply to job offer
    Given I access the offers list page
    And the candidate form is filled with "candidate@gmail.com"
    When candidate applies an offer
    Then I should receive an email from "infojobvacancy2016@gmail.com"
    And I should see "offerer@gmail.com" in the email body
