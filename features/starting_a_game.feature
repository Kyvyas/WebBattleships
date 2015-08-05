
Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Creating a new game
    Given I am on "Register"
    When I fill in "name" with "gaby"
    Then I press "Submit"
    Then I should see "Let's play Battleships"

    Given I am on "Register"
    When I fill in "name" with ""
    Then I press "Submit"
    Then I should see "Please enter your name"

    Given I am on "Register"
    When I fill in "name" with "gaby"
    Then I press "Submit"
    When I follow "Play Game"
    Then I should be on "/game"

  Scenario: Placing a ship
    Given I am on "game"
    Then I should see "Please place a ship"

    Given I am on "game"
    When I fill in "coordinates" with "A3"
    When I choose "submarine" within "ship"
    When I choose "vertical" within "orientation"
    Then I press "Place ship"
    Then I should see "Ship is placed"


