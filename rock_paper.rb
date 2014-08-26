def user_choice
	puts "Enter Rock, Paper, Scissors"
	draw_user=gets.chomp.downcase
	if draw_user=='rock' 
		user_num=1
	elsif draw_user=='paper'
		user_num=2
	elsif draw_user=='scissors'
		user_num=3
	else
		puts "Try again"
		user_choice
	end
end

puts "What score do you want to play to"
max_score = gets.to_i
user_score=0
com_score=0

until (user_score == max_score || com_score == max_score)

	draw_com=rand(1..3)
	puts "************************"
	user_num=user_choice()

	if draw_com == 1 and user_num == 2
		user_score +=1
		puts "Computer: Rock  User: Paper  You win!"
		
	elsif draw_com == 2 and user_num == 3
		user_score +=1
		puts "Computer: Paper  User: Scissors  You win!"
		
	elsif  draw_com == 3 and user_num == 1
		user_score +=1
		puts "Computer: Scissors  User: Rock  You win!"
		
	elsif	draw_com == 1 and user_num == 3
		com_score +=1
		puts "Computer: Rock  User: Scissors  You lose!"
		
	elsif draw_com == 2 and user_num == 1
		com_score +=1
		puts "Computer: Paper  User: Rock  You lose!"
		
	elsif draw_com == 3 and user_num == 2
		com_score +=1
		puts "Computer: Scissors  User: Paper  You lose!"
		
	elsif draw_com == user_num
		puts "Draw!"
	else
	puts 'Something went wrong'
	end
  
	puts "Score\nComputer: #{com_score}  User: #{user_score}"
	puts "************************"
	puts''
end

puts "************************"
puts "GAME OVER\nFinal score\nComputer: #{com_score}  User: #{user_score}"
puts "************************"


  






