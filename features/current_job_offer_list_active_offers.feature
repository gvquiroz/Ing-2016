Feature: Active Job Offers list
  In order to get a job
  As a candidate
  I want to see current job offers

  Scenario: Current Job Offers
    Given a "Web Programmer" offer has pass the due date
    When I access the offers list page
    Then I should not see "Web Programmer" in the offers list page
