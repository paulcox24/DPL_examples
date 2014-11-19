class Calculator

  def calc
  #into
    puts "Weclome to Calculator"
  #display options, initialize variables
    puts "Valid commands\n+   Add\n-   Subtract\n*   Multiply\n/   Divide\n**  Exponential\nsqrt  Square Root\nc   Clear Calculator\nq   Quit\nEnter numbers and commands with spaces"
    input = []
    current_value = 0
    value1 = nil
  # calculate
    loop do
      print ">> "
      input = gets.chomp.split(" ")  #get user input in a string and break into array
      return if input[0] == 'q' # allow user to quit out

      if input[0] == 'c' #clear the calculator
      	value1 =  nil
      	current_value = 0
      	puts "Cleared! Current value is #{current_value}\n "
  			redo
    	end
      if value1 == nil #inital input from user
      	value1 = input[0].to_f 
  			value2 = input[2].to_f
  	    operator = input[1]
  	  else
  	  	value1 = current_value #after inital value is in calc
  	  	value2 = input[1].to_f
  	  	operator = input[0]
  	  end

      case operator #math!
      when "+" then current_value = value1 + value2
      when "-" then current_value = value1 - value2
      when "*" then current_value = value1 * value2
      when "/" then current_value = value1 / value2
      when "**" then current_value = value1 ** value2
      when "sqrt" then current_value = value1 **(0.5)
      when nil then current_value = value1	
         	
  	  else 
  	  	puts "Invalid input!"	 #failsafe
      end
      puts "Current value is #{current_value}\n " #display current value
  		    
    end

  end

calculator = Calculator.new
calculator.calc


end



