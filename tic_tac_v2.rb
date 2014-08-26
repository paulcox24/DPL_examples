# still to do: secect number of players

def tic_tac
	puts "**********************"
	puts "Welcome to Tic Tac Toe"
	puts "**********************\n "

	# select player x or o, assign computer the opposite
	player = nil
	until (player == :X || player == :O) #wont allow anything but x or o
	puts "Would you like to be X or O?"
	player = gets.chomp.upcase
		if player == "X"
			player = :X
			computer = :O
		elsif player == "O"
			player = :O
			computer = :X
		else
			puts "Please enter X or O\n "
			end
	end

	#show current player/computer assignment
	puts "Player:  #{player}\nComputer:  #{computer}"
	puts " "

	# create board
	board = [[1,2,3],[4,5,6],[7,8,9]]

	# show board
	board.each do
		|r| puts r.map { |p| p}.join(' ')
	end

	puts ''	

	choice_options = [1,2,3,4,5,6,7,8,9]
	loop do
		#player turn
		puts "Select a Square 1-9"
		player_choice = gets.chomp.to_i
		if choice_options.include?(player_choice) 
		else
		  puts "Try again" 
		  redo
		end	
	 # select which square 
		case player_choice
		when 1 then board[0][0] = "#{player}"
		when 2 then board[0][1] = "#{player}"
		when 3 then board[0][2] = "#{player}"
		when 4 then board[1][0] = "#{player}"
		when 5 then board[1][1] = "#{player}"
		when 6 then board[1][2] = "#{player}"
		when 7 then board[2][0] = "#{player}"
		when 8 then board[2][1] = "#{player}"
		when 9 then board[2][2] = "#{player}"
		else puts "Invalid selection"
	end
		choice_options = choice_options - [player_choice] #remove selection from options
	
		#computer turn
		computer_choice = choice_options.sample
		break if choice_options.empty?
		
		case computer_choice
		when 1 then board[0][0] = "#{computer}"	
		when 2 then board[0][1] = "#{computer}"
		when 3 then board[0][2] = "#{computer}"
		when 4 then board[1][0] = "#{computer}"
		when 5 then board[1][1] = "#{computer}"
		when 6 then board[1][2] = "#{computer}"
		when 7 then board[2][0] = "#{computer}"
		when 8 then board[2][1] = "#{computer}"
		when 9 then board[2][2] = "#{computer}"
		else puts "Invalid selection"
		end
		puts ''
		puts "******************\n "
		
		board.each do
			|r| puts r.map { |p| p}.join(' ')
		end
		puts ''

		choice_options = choice_options - [computer_choice] #remove selection from options
	  puts "\nYou chose: #{player_choice}"	
		puts "Computer chose: #{computer_choice}"
		puts "******************"
		puts ''

		# detect wins
		if board[0][0] == board[0][1] and board[0][1] ==  board[0][2]
			puts "#{board[0][0]} is the winner!"
			break
		elsif board[1][0] == board[1][1] and board[1][1] == board[1][2]
			puts "#{board[1][0]} is the winner!"
			break
		elsif board[2][0] == board[2][1] and board[2][1] == board[2][2]
			puts "#{board[2][0]} is the winner!"
			break
		elsif board[0][0] == board[1][0] and board[1][0] == board[2][0]
			puts "#{board[0][0]} is the winner!"
			break
		elsif board[0][1] == board[1][1] and board[1][1] == board[2][1]
			puts "#{board[0][1]} is the winner!"	 
			break
		elsif board[0][2] == board[1][2] and board[1][2] == board[2][2]
			puts "#{board[0][2]} is the winner!"	 
			break
		elsif board[0][0] == board[1][1] and board[1][1] == board[2][2]
			puts "#{board[0][0]} is the winner!"	 
			break
		elsif board[2][0] == board[1][1] and board[1][1] == board[0][2]
			puts "#{board[2][0]} is the winner!"	 
			break			
		else
			next
		end
	end
	puts "\nDraw!" if choice_options.empty? # detect stalemate
end
#ask to play again
loop do
	puts ''
  puts 'Play Tic Tac Toe? y/n'
  again= gets.chomp.downcase
  if again == "y"
		tic_tac()
	else
	exit
	end
end

