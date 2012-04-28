Feature: Mechanize uses frames like GUI browser.
  In order to parse html tags of non-frame pages.
  I return tags in html pages.

  Scenario: new page
    Given I don't get any page.
    When I get a non-frame page.
    Then I should return tags in the page.

  Scenario: click
    Given I have a visited page.
    When I click a link and get a non-frame page.
    Then I should also return tags in the page.
