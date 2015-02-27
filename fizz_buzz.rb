# (1..100).each do |i|
  # if  i % 3 == 0 && i % 5 == 0
  #   puts "FizzBuzz"  
  # elsif i % 5 == 0
  #   puts "Buzz"  
  # elsif i % 3 == 0 
  #   puts "Fizz" 
  # else
  #   puts i
  # end
# end

# (1..100).each { |i| i % 5 == 0 ? (i % 3 == 0 ? (puts "FizzBuzz") : (puts "Buzz")) : (i % 3 == 0 ? (puts "Fizz") : (puts i)) }

# (1..100).each do |i|
#   x = ""
#   x += 'Fizz' if i%3==0
#   x += 'Buzz' if i%5==0
#   puts(x.empty? ? i : x);
# end