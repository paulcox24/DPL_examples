
puts "Enter a string"
word= gets.chomp

a=[]
word.each_char do |char|
	a<<char
end

word_index= a.length.to_i-1

rev_word_array=[]
until word_index == -1 do
	rev_word_array<< a[word_index]
	word_index -= 1
end

rev_word= rev_word_array.join.to_s

puts word
puts rev_word

