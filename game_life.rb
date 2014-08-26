

@board_size = 10
@counter = 0 # initiate counter
@continue = 0# break for the loop
@times_to_run = 200

# 	@board = 
# [['x','o','x','o','x'],
#  ['x','o','o','o','x'],
#  ['x','o','x','o','o'],
#  ['o','o','o','o','x'],
#  ['o','o','x','o','x']]
#@board= Array.new(board_size) {Array.new(board_size, ['x','o'].sample)} #creates board all spaces dead 'x'

 loop

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
	puts "How large would you like the board?
	\nBoard will be 10x10 by defalut
	\nEnter a number 1 - 40"
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
	a = ['o','o',' ',' ',' ',' ',' ',' ',' ',' ']*@board_size
	@board = []
	@board_size.times { @board << a.sample(@board_size) }
  @tracker = @board#create initial tracker from board
  @living = Array.new(@board_size) {Array.new(@board_size)}
end


def display_board
puts ''
@board.each { |row| puts row.join(' ')} #display board
puts ''
end

def display_living
puts ''
@living.each { |row| puts row.join(' ')} #display board
puts ''
end


#live
def live(xpos, ypos)
	@tracker[xpos][ypos] = 'o'	
end

#kill
def kill(xpos, ypos)
	@tracker[xpos][ypos] = ' '	
end

def check_edge(posx, posy, xmod, ymod)
	  # xpos and ypos are the x and y coordinates of the cells we are checking
	  # xmod and ymod are the modifiers to get to an adjacent cell
	  # I.E if we wish to evaluate the top left cell, the modifiers are xmod = -1 and ymod = 1
	  # we set x to be the x coordinate of the cell we are checking
	  x = posx + xmod
	  # If the cell is on the edge of the grid and we add to it, it will return nil
	  # This is because arrays are indexed from 0
	  # If we pass in the coordinates for 0, 4 as the cell, adding 1 to 4 will become 5 which is outside the boundary of the array
	  # In this case, we manually set the value to be 0, so that instead of going outside the array, it jumps to the other side
	  if posx + xmod >= @board_size
      x = 0
	  end

	  if posx + xmod < 0
	  	x = @board_size - 1
	  end

	  y = posy + ymod

	  if posy + ymod >= @board_size
      y = 0
	  end

	  if posy + ymod < 0
	  	y = @board_size -1
	  end

	  if @board[x][y] == 'o'
	   @surrounding_live += 1

	  end
end



#cell is the value in the cell @board[xpos][ypos]
#xpos is the row position, the index in the overall board array
#ypos is the column position, the index in the row array in the board array
def live_die#update tracker
	@board.each_with_index do |row, xpos|
		row.each_with_index do |cell, ypos|
			@surrounding_live = 0
		  check_edge(xpos, ypos, 0, -1)
		  check_edge(xpos, ypos, 0, 1)
			check_edge(xpos, ypos, 1, 0)
		  check_edge(xpos, ypos, 1, 1)
		  check_edge(xpos, ypos, 1, -1)
		  check_edge(xpos, ypos, -1, 0)
		  check_edge(xpos, ypos, -1, 1)
		  check_edge(xpos, ypos, -1, -1)

      @living[xpos][ypos] = @surrounding_live

			if cell == 'o'
	      if @surrounding_live == 2 || @surrounding_live == 3
	          live(xpos,ypos)
	      else
	          kill(xpos,ypos)
	      end
	    else
	      if @surrounding_live == 3
		      live(xpos,ypos)
		     else
		     	kill(xpos,ypos)
		    end
	    end
	  end
	end

	@board= @tracker
end 	

define_board
times_to_run
random_board

while @counter < @times_to_run
	
	system("clear")
  # display_living
	display_board
	@counter +=1
	puts "Counter: #{@counter}"
	live_die
	sleep(0.15)

end







