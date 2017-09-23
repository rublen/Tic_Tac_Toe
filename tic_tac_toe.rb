require_relative "board"
require_relative "player"
require_relative "game"

module TicTacToe

  game = Game.new

  player1 = game.player1.set_player 
  puts
  player2 = game.player2.set_player
  
  board_with_nums = Board.new
  board_with_nums.board = (1..9).to_a
  board_with_nums.display
  
  puts "\n", "Put 'Enter' if you are ready"
  gets
  
  until game.over?
  	current_player = game.whos_turn 	
  	puts "[#{current_player.token}] #{current_player.name} enter the number from 1 to 9: "
  	cell = gets.strip.to_i - 1
  	game.make_step(cell, current_player)
  	game.board.display
  end

  puts "The game is over with draw!" if game.board.draw?

  puts "Winner is #{game.winner.name}. Congratulates!" if game.board.won?

end
