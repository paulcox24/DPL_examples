class Calculator
  @@calc_count = 0
  attr_accessor :value2

  def initialize
    @@calc_count += 1
    puts "Welcome to the Calculator\nPlease enter your first value"
    @value1 = gets.chomp.to_i
    puts 'Please enter your second value'
    @value2 = gets.chomp.to_i
    run_operation
    print_result(@result)
  end

  def self.calc_count
    @@calc_count
  end

  #getters
  def value1
    @value1
  end

  # attribute accessor takes care of this
  # def value2
  #   @value2
  # end

  #setters
  def value1=(value)
    @value1 = value
  end

  # attribute accessor takes care of this
  # def value2=(value)
  #   @value2 = value
  # end  

  def get_operator
    puts "What operation would you like to perform\n1. Add\n2. Subtract\n3. Multipy\n4. Divide"
    operation = gets.chomp.to_i  
    if (1..4) === operation
      operation
    else
      get_operator 
    end   
  end

  def run_operation(operation=get_operator)
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
    @result = @value1 + @value2
  end

  def subtract
    @result = @value1 - @value2
  end

  def multiply
    @result = @value1 * @value2
  end

  def divide
    @result = @value1.to_f / @value2.to_f
  end 

  def print_result(result=@result)
    puts "Your answer is #{result}"
  end

end

@calc = Calculator.new
