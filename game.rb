module TicTacToe

	class Game

		attr_accessor :board
		attr_reader :player1, :player2

		def initialize
			@board = Board.new
			@player1 = Player.new
			@player2 = Player.new
		end

		def whos_turn
			@board.count_turns % 2 == 0 ? @player1 : @player2
		end

		def over?
			@board.draw? || @board.won?
		end

		def make_step(cell, player)
  		if @board.valid_step?(cell) 
  			@board.update(cell, player.token)
  		else 
  			puts("Invalid step")
  		end
   	end

  	def winner
  		board.win_token == @player1.token ? @player1 : @player2
  	end

	end

end