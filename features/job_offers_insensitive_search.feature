Feature: Job Offers Search
  In order to get a job
  As a candidate
  I want to search offers

  Background:
  	Given two offers exist in the offers list with tittle "Senior Web Programmer" and "SENIOR Java Programmer"

  Scenario: Search job offers
   When I fill the search box with "Senior"
   And confirm the search
   Then I should see "Senior Web Programmer" And "SENIOR Java Programmer" in the list
