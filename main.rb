require './Player.rb'
require './Game.rb'
require './Questions.rb'

# Create two player objects
player1 = Player.new("Player 1")
player2 = Player.new("Player 2")

# Create a game object with the two players
game = Game.new(player1, player2)

# Start the game
game.start_game