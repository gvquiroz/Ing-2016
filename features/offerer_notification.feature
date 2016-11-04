Feature: Offerer notification
  In order to get a job
  As a Offerer
  I want to get an email notification when a candidate apply an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: A candidate applies to a job offer
    Given the candidate form is filled with "candidate@gmail.com"
    When candidate applies an offer
    Then I should receive an email from "infojobvacancy2016@gmail.com"
    And I should see "candidate@gmail.com" in the email body
