module TicTacToe

	class Board

		WIN_COMBS = [ [0,1,2], [0,3,6], 
									[1,4,7], [3,4,5],
									[6,7,8], [2,5,8], 
									[0,4,8], [2,4,6] ]

		@@win_token = nil
		
		attr_accessor :board

		def initialize
			@board = Array.new(9, " ")
		end

		def display
	    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	    puts "---|---|---"
	    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	    puts "---|---|---"
	    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	  end

	  def update(cell, token)
	  	@board[cell] = token
	  end

	  def count_turns
	    @board.count { |cell| cell == 'X' || cell == 'O' }
	  end
	  
		def full?
	  	@board.none? { |cell| cell == ' ' }
	  end

	  def valid_step?(cell)
	  	(0..8).include?(cell) && @board[cell] == ' '
	  end

		def won?
	  	WIN_COMBS.each do |comb| 
	  		if @board[comb[0]] != ' ' && comb[1..2].all? { |cell| @board[cell] == @board[comb[0]] }
	  			@@win_token = @board[comb[0]]
	  			return true
	  		end
	  	end
	  	false
	  end

		def draw?
	  	!won? && full?
	  end

		def win_token
			@@win_token
		end
	  
	end

end

