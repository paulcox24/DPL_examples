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
	board_top_row ={tl: "[1] ", tc: '[2] ', tr: '[3]'}
	board_middle_row ={ml: "[4] ", mc: '[5] ', mr: '[6]'}
	board_bottom_row ={bl: '[7] ', bc: '[8] ', br: '[9]'}

	# show board
	puts "   " + board_top_row[:tl] + board_top_row[:tc] + board_top_row [:tr]
	puts ''
	puts "   " + board_middle_row[:ml] + board_middle_row[:mc] + board_middle_row [:mr]
	puts''
	puts "   " + board_bottom_row[:bl] + board_bottom_row[:bc] + board_bottom_row [:br]
	puts ""

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
		when 1 then board_top_row[:tl] = "[#{player}] "
		when 2 then board_top_row[:tc] = "[#{player}] "
		when 3 then board_top_row[:tr] = "[#{player}] "
		when 4 then board_middle_row[:ml] = "[#{player}] "
		when 5 then board_middle_row[:mc] = "[#{player}] "
		when 6 then board_middle_row[:mr] = "[#{player}] "
		when 7 then board_bottom_row[:bl] = "[#{player}] "
		when 8 then board_bottom_row[:bc] = "[#{player}] "
		when 9 then board_bottom_row[:br] = "[#{player}] "
		else puts "Invalid selection"
		end
		choice_options = choice_options - [player_choice] #remove selection from options
	
		#computer turn
		computer_choice = choice_options.sample
		break if choice_options.empty?
		
		case computer_choice
		when 1 then board_top_row[:tl] = "[#{computer}] " 
		when 2 then board_top_row[:tc] = "[#{computer}] "
		when 3 then board_top_row[:tr] = "[#{computer}] "
		when 4 then board_middle_row[:ml] = "[#{computer}] "
		when 5 then board_middle_row[:mc] = "[#{computer}] "
		when 6 then board_middle_row[:mr] = "[#{computer}] "
		when 7 then board_bottom_row[:bl] = "[#{computer}] "
		when 8 then board_bottom_row[:bc] = "[#{computer}] "
		when 9 then board_bottom_row[:br] = "[#{computer}] "
		else puts "Invalid selection"
		end
		puts ''
		puts "******************\n "
		puts "   " + board_top_row[:tl] + board_top_row[:tc] + board_top_row [:tr]
		puts ''
		puts "   " + board_middle_row[:ml] + board_middle_row[:mc] + board_middle_row [:mr]
		puts ''
		puts "   " + board_bottom_row[:bl] + board_bottom_row[:bc] + board_bottom_row [:br]

		choice_options = choice_options - [computer_choice] #remove selection from options
	  puts "\nYou chose: #{player_choice}"	
		puts "Computer chose: #{computer_choice}"
		puts "******************"
		puts ''

		# detect wins
		if board_top_row[:tl] == board_top_row[:tc] and board_top_row[:tc] ==  board_top_row [:tr]
			puts "#{board_top_row[:tl]} is the winner!"
			break
		elsif board_middle_row[:ml] == board_middle_row[:mc] and board_middle_row[:mc] == board_middle_row [:mr]
			puts "#{board_middle_row[:ml]} is the winner!"
			break
		elsif board_bottom_row[:bl] == board_bottom_row[:bc] and board_bottom_row[:bc] == board_bottom_row [:br]
			puts "#{board_bottom_row[:bl]} is the winner!"
			break
		elsif board_top_row[:tl] == board_middle_row[:mc] and board_middle_row[:mc] == board_bottom_row [:br]
			puts "#{board_bottom_row[:br]} is the winner!"
			break
		elsif board_bottom_row[:bl] == board_middle_row[:mc] and board_middle_row[:mc] == board_top_row [:tr]
			puts "#{board_bottom_row[:bl]} is the winner!"	 
			break
		elsif board_bottom_row[:bl] == board_middle_row[:ml] and board_middle_row[:ml] == board_top_row [:tl]
			puts "#{board_bottom_row[:bl]} is the winner!"	 
			break
		elsif board_bottom_row[:bc] == board_middle_row[:mc] and board_middle_row[:mc] == board_top_row [:tc]
			puts "#{board_bottom_row[:bl]} is the winner!"	 
			break
		elsif board_bottom_row[:br] == board_middle_row[:mr] and board_middle_row[:mr] == board_top_row [:tr]
			puts "#{board_bottom_row[:br]} is the winner!"	 
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

