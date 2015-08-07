Feature: Playing a game

Scenario: Placing a ship
    Given I am on "game"
    Then I should see "Please place a ship"

    Given I am on "game"
    When I fill in "coordinates" with "A3"
    When I choose "submarine" within "ship"
    When I choose "vertical" within "orientation"
    Then I press "Place ship"
    Then I should see

