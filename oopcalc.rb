class Calculator
  @@calc_count = 0
  attr_accessor :value1
  def initialize(value1,value2)
    @value1 = value1
    @value2 = value2
    @@calc_count += 1
    puts "Your values are \n#{@value1} and #{@value2}"
  end

  # #getter methods
  # def value1
  #     @value1
  # end

  def value2
    @value2
  end

  # # setter methods
  # def value1=(value)
  #   @value1 = value
  # end

  def value2=(value)
    @value2 = value
  end

  def self.calc_count
    @@calc_count
  end


  def add
    result = @value1 + @value2
    puts result
  end

  def subtract
    result = @value1 - @value2
    puts result
  end

  def multiply
    result = @value1 * @value2
    puts result
  end

  def divide
    result = @value1.to_f / @value2.to_f
    puts result
  end         
end

puts "Welcome to Calculator please enter your first value"

value1 = gets.chomp.to_i

puts "And your second"

value2 = gets.chomp.to_i

@calc = Calculator.new(value1,value2)