def even_odd
  puts "Enter a number"
  number=gets.chomp.to_i
  if number.even? and number%3==0
    puts "#{number} is an even number and is divisible by 3"
  elsif number.odd? and number%3==0
    puts "#{number} is an odd number and is divisible by 3"
  elsif number.odd? 
    puts "#{number} is an odd number"
  elsif number.even? 
    puts "#{number} is an even number"
  else
    puts "Try again"
  end 
end
    
even_odd()