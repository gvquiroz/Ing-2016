Feature: Offerer notification
  In order to get a job
  As a Offerer
  I want to get an email notification when a candidate apply an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list

  Scenario: A candidate applies to a job offer
    Given I access the offers list page
    And a candidate click apply
    Given the candidate form is filled with "candidate@gmail.com"
    When candidate confirm job application
    Then I should receive an email from "infojobvacancy2016@gmail.com"
    And I should see "Job Application: Contact information from offer: job offer tittle" in the email subject
    And I should see "the title, location and description of the offer" in the email body
