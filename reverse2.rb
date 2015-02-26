def reverse_it(string)
  string_index = string.length-1
  @rev_string = ""
  string_index.downto(0) { |i| @rev_string << @rev_string += string.chars[i]}
  puts @rev_string
end

def capitalize_first(rev_string)
  words = rev_string.split(" ")
  words.each_with_index { |word, index| word.capitalize! if index.odd? }
  puts words.join(" ")
end

puts "Enter a string"
reverse_it(gets.chomp)
capitalize_first(@rev_string)

