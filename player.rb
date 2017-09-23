module TicTacToe
	
	class Player
		
		TOKENS = ['X', 'O']
		@@counter = 0
		@@chosen = []

		attr_reader :name, :token
		
		def initialize(name = 'Player#', token = nil)
			@@counter += 1
			@number_of_player = @@counter			
			@name = name + @number_of_player.to_s
			@token = token			
		end
		
		def name=(name)
			while name.chomp == '' || name == nil
				puts 'Enter your name, please: '
				name = gets.strip.upcase
			end
			@name = name
		end

		def token=(token)
			if @number_of_player == 1				
				until TOKENS.include?(token)
					puts 'Invalid token. Enter X or O: '
					token = gets.strip.upcase
				end
				@@chosen << token
			else
				token = (TOKENS - @@chosen)[0]
				@@chosen = []
				@@counter = 0
			end
			@token = token
		end
	
		def set_player 
			print "Hi, #{@name}! Enter your name, please: "
			name = gets.strip.upcase
			self.name = name
			print "\n", "Pleasant to meet you #{@name}! " 
			if @number_of_player == 1
				print "Choose 'X' or 'O' for your token: "
				self.token = gets.strip.upcase
			else
				self.token = @token
				puts "You have no choice:) Your token is #{@token}"
			end
			self
		end
		
	end
	
end
