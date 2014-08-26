# Reversing a String
 
puts 'Give me your string'
string_captured = gets().chomp # Get the input and remove the new line characted
 
# Go through each char from beginning to end in the captured string and then 
# concatenate them by putting the last characted accessed at the beginning 
# of the new string.
new_string_v1 = ''
string_captured.chars.each{|c| new_string_v1 = c + new_string_v1}
puts "First form: #{new_string_v1}"
 
# Go through each char from end to beginning in the captured string and then
# add each char to the end of the new string 
new_string_v2 = ''
string_captured.length().downto(1) {|c| new_string_v2 += string_captured[c-1]}
puts "Second form: #{new_string_v2}"
 
# Get the length of the string and subtract one to the the last index of the
# captured string
new_string_v3 = ''
index = string_captured.length-1
# (string_captured.length()..0) # Reverse ranges do not work
# While the new string is smaller than the captured string 
while new_string_v3.length < string_captured.length
  # Grab the character at the position indicated by index
    new_string_v3 += string_captured[index]
  puts new_string_v3
  # Reduce index by one, so the next interation captures the previous characted
  index -= 1 
end
puts "Third form: #{new_string_v3}"

puts "This is a palindrome" if new_string_v1 == string_captured