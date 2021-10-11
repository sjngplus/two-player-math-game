require './Game'
require './Player'

player1 = Player.new "Amos"
player2 = Player.new "Jim"
new_game = Game.new(player1, player2)

new_game.play_game