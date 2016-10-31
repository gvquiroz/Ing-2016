Feature: Offerer notification
  In order to get a job
  As a Offerer
  I want to get an email notification when a candidate apply an offer

  Background:
  	Given only a "Web Programmer" offer exists in the offers list
   
  Scenario: A candidate applies to a job offer
    When a candidate apply
    Then I should recive an mail with candidate cv link