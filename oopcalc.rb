class Calculator
  attr_accessor :value_1
  def initialize(value1,value2)
    @value_1 = value1
    @value_2 = value2

    puts "Your values are \n#{@value_1} and #{@value_2}"
  end

  # #getter methods
  # def value_1
  #     @value_1
  # end

  def value_2
    @value_2
  end

  # # setter methods
  # def value_1=(value)
  #   @value_1 = value
  # end

  def value_2=(value)
    @value_2 = value
  end

  def add
    result = @value_1 + @value_2
    puts result
  end

  def subtract
    result = @value_1 - @value_2
    puts result
  end

  def multiply
    result = @value_1 * @value_2
    puts result
  end

  def divide
    result = @value_1.to_f / @value_2.to_f
    puts result
  end         
end

puts "Welcome to Calculator please enter your first value"

value_1 = gets.chomp.to_i

puts "And your second"

value_2 = gets.chomp.to_i

@calc = Calculator.new(value_1,value_2)