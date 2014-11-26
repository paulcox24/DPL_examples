class Calculator
  def initialize
    puts 'Welcome to the Calculator'
    puts 'Please enter your first value'
    @value_1 = gets.chomp.to_i
    puts 'Please enter your second value'
    @value_2 = gets.chomp.to_i
    run_operation(get_operator)
  end

  #getters
  def value_1
    @value_1
  end

  def value_2
    @value_2
  end

  #setters
  def value_1=(value)
    @value_1 = value
  end

  def value_2=(value)
    @value_2 = value
  end  

  def get_operator
    puts "What operation would you like to perform\n1. Add\n2. Subtract\n3. Multipy\n4. Divide"
    operation = gets.chomp.to_i  
    if (1..4) === operation
      operation
    else
      get_operator 
    end   
  end

  def run_operation(operation)
    case operation 
    when 1
      add
    when 2
      subtract
    when 3
      multiply
    when 4
      divide
    end  
  end  

  def add
    result = @value_1 + @value_2
    puts "Your answer is #{result}"
  end

  def subtract
    result = @value_1 - @value_2
    puts "Your answer is #{result}"
  end

  def multiply
    result = @value_1 * @value_2
    puts "Your answer is #{result}"
  end

  def divide
    result = @value_1.to_f / @value_2.to_f
    puts "Your answer is #{result}"
  end 

end

@calc = Calculator.new
