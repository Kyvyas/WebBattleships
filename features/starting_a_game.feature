
Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Creating a new game
    Given I am on the homepage
    When I fill in "name" with ""
    Then I press "Submit"
    Then I should see "Player 1"

    Given I am on the homepage
    When I fill in "name" with "Katya"
    Then I press "Submit"
    Then I should be on "/game"



