@board_size = 10
@counter = 0 # initiate counter
@times_to_run = 200
@alive = '[]'
@dead = '..'
@percent_alive = 20

# 	@board = 
# [['x','o','x','o','x'],
#  ['x','o','o','o','x'],
#  ['x','o','x','o','o'],
#  ['o','o','o','o','x'],
#  ['o','o','x','o','x']]
#@board= Array.new(board_size) {Array.new(board_size, ['x','o'].sample)} #creates board all spaces dead 'x'

def times_to_run
	puts "How many games?\nDefault is 200."
	number = gets.chomp.to_i
	case number
	when (1..2000)
	 	@times_to_run= number
	 	puts "\n#{number} selected\n "
	else
		puts "\nDefault selected\n "
	end	
end


def define_board
	puts "How large would you like the board?"
	puts "Board will be 10x10 by defalut"
	puts "Enter a number 1 - 40"
	selection = gets.chomp.to_i
	case selection
	when (1..50)
	 	@board_size= selection
	 	puts "\n#{selection} selected\n "
	else
		puts "\nDefault selected\n "
	end
end


def random_board
	# a = [@alive,@alive,'  ','  ','  ','  ','  ','  ','  ','  ']*@board_size
	# alive_sample = Array.new(2 * @board_size) { |i| @alive }
	# dead_sample = Array.new(8 * @board_size) { |i| @dead }
	# sample_array = alive_sample + dead_sample
	sample_array = Array.new(10 * @board_size) { |i| rand(0..100) <= @percent_alive ? @alive : @dead }
	@board = []
	@board_size.times { @board << sample_array.sample(@board_size) }
  @tracker = Array.new(@board_size) {Array.new(@board_size, 0)}
  @living = Array.new(@board_size) {Array.new(@board_size, @dead)}
end


def display_board
	puts ''
	@board.each { |row| puts row.join(' ')} #display board
	puts ''
end

def display_living
	puts "\nTracker #{@counter}"
	@living.each { |row| puts row.join('  ')} #display board
	puts ''
end


#live
def live(x, y)
	@tracker[x][y] = @alive	
end

#kill
def kill(x, y)
	@tracker[x][y] = @dead
end

def check(x, y, xmove, ymove) # check and adjacent cell for alive or dead
  if x + xmove >= @board_size # return to index 0 if the modifier goes above the board
    x = 0
  elsif x + xmove < 0  # return to the end of the board if modifiers moves below
  	x = @board_size - 1
  else
  	x = x + xmove # new xition from the modifyer
  end

  if y + ymove >= @board_size
    y = 0
  elsif y + ymove < 0
  	y = @board_size -1
  else
  	y = y + ymove
  end
  @surrounding_live += 1 if @board[x][y] == @alive #if neighbor cell is alive add to the count
end



#cell is the value in the cell @board[x][y]
#x is the row position, the index in the overall board array
#y is the column position, the index in the row array in the board array
def live_die #update tracker
	@cells_alive = 0
	@board.each_with_index do |row, x|
		row.each_with_index do |cell, y|
			@surrounding_live = 0
		  check(x, y, 0, -1)
		  check(x, y, 0, 1)
			check(x, y, 1, 0)
		  check(x, y, 1, 1)
		  check(x, y, 1, -1)
		  check(x, y, -1, 0)
		  check(x, y, -1, 1)
		  check(x, y, -1, -1)

      @living[x][y] = @surrounding_live

			if cell == @alive
	      if @surrounding_live == 2 || @surrounding_live == 3
	        live(x,y)
	      else
	        kill(x,y)
	      end
	      @cells_alive += 1
	    else
	      if @surrounding_live == 3
		      live(x,y)
		     else
		     	kill(x,y)
		    end
	    end
	  end
	end

	@board = @tracker #copy completed tracker to new board

	@tracker = Array.new(@board_size) {Array.new(@board_size, 0)} #reset tracker

end 	

define_board
times_to_run
random_board

while @counter < @times_to_run
	system("clear")
  display_living
	display_board
	@counter +=1
	live_die
	puts "Counter: #{@counter}"
	puts "Cells Alive: #{@cells_alive}"
	sleep(0.15)
	break if @cells_alive <= 0

end


