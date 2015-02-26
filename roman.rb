#roman numerals
@continue = true

def new_number
  puts "Enter a number 1 - 999"
  @number = gets.chomp
  @digits_array = @number.to_s.split('')
  @digits_length  = @digits_array.length
  @single_digit_roman = Hash[(1..9).to_a.zip(%w(I II III IV V VI VII VIII IX))]
  @tens_roman = Hash[(1..9).to_a.zip(%w(X XX XXX XL L LX LXX LXXX XC))]
  @hundreds_roman = Hash[(1..9).to_a.zip(%w(C CC CCC CD D DC DCC DCCC CM))]
end

def standardize
  if @digits_length == 3
    @digits_array
  elsif @digits_length == 2
    @digits_array.unshift(nil)
  elsif @digits_length == 1 
    @digits_array.unshift(nil, nil) 
  end
end

def convert_digits
  @roman_single = @single_digit_roman[@digits_array[2].to_i]
  @roman_tens = @tens_roman[@digits_array[1].to_i]
  @roman_hundreds = @hundreds_roman[@digits_array[0].to_i]
end

def recombine
  roman = [@roman_hundreds, @roman_tens, @roman_single]
  roman.compact!
  puts "\n#{@number} in Roman Numerals is \n#{roman.join}\n "
end

def again
  puts "Continue...   y/n"
  if gets.chomp.downcase.chars.first == 'y'
    @continue = true
  else 
    @continue = false
  end
end

while @continue do
  new_number()
  standardize()
  convert_digits()
  recombine()
  again()
end