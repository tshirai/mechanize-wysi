Feature: Mechanize uses frames like GUI browser.
  In order to parse html tags of non-frame pages.
  I return tags in html pages.

  @wip
  Scenario: new frame page
    Given I don't get any page.
    When I get a frame page.
    Then I should return tags in the frame page.

  Scenario: click a link in frames.
    Given I have a visited frame page.
    When I click a link and get a frame page.
    Then I should also return tags in the next frame page.

  Scenario: new iframe page
    Given I don't get any page.
    When I get a iframe page.
    Then I should return tags in the iframe page.

  Scenario: click a link in iframe.
    Given I have a visited iframe page.
    When I click a link and get a iframe page.
    Then I should also return tags in the next iframe page.
