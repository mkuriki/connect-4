require_relative 'player'
require_relative 'board'
require_relative 'game'

print "Player x, please enter your name: "
player_x = Player.new(gets.chomp, 'x')

print "Player o, please enter your name: "
player_o = gets.chomp
while player_o.downcase == player_x.name.downcase
  print "Name must be unique; please enter your name: "
  player_o = gets.chomp
end
player_o = Player.new(player_o, 'o')

board = Board.new
game = Game.new(player_x, player_o)
play_game = true

while play_game
  game.play(board)

  print "Would you like to play the game again? (Y/N): "
  answer = gets.chomp.downcase

  if answer == 'y'
    board = Board.new
    game.next_turn
  else
    play_game = false
  end
end
