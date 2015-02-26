class HighCard
  attr_accessor :deck
  SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]
  VALUES = ["2", "3", "4", "5", "6","7","8","9", "10", "Jack", "Queen", "King", "Ace"]

  def initialize
    @deck = []
    @comp_score = 0
    @player_score = 0
    @draw_count = 0
    @game_count = 0
    SUITS.each do |suit|
      VALUES.each do |value|
          @deck << (value + " of " + suit)
      end
    end
  end

  def draw_card
    unless @deck.empty?
      @card = @deck.sample
      @deck.delete(@card)
      puts "You drew #{@card}"
      return @card
    end  
  end

  def draw_computer
    unless @deck.empty?
      @comp_card = @deck.sample
      @deck.delete(@comp_card)
      puts "Computer drew #{@comp_card}"
      return @comp_card
    end 
  end

  def deal
    draw = draw_card.split(" ")
    comp_draw = draw_computer.split(" ")
    draw_value = VALUES.index(draw[0]) 
    comp_value = VALUES.index(comp_draw[0])
    if draw_value > comp_value
      @player_score += 1
      puts "Winner! You got the high card!\nPlayer - #{@player_score}\nComputer - #{@comp_score}"
    elsif draw_value < comp_value
      @comp_score += 1
      puts "Womp, Womp. Computer got the high card!\nPlayer - #{@player_score}\nComputer - #{@comp_score}"
    else 
      if SUITS.index(draw[2]) > SUITS.index(comp_draw[2])
        @player_score += 1
        puts "Winner! You got the high suit!\nPlayer - #{@player_score}\nComputer - #{@comp_score}"
      else
        @comp_score += 1
        puts "Womp, Womp. Computer got the high suit!\nPlayer - #{@player_score}\nComputer - #{@comp_score}"
      end
    end
    puts "*********************"
  end

  def full_deck
    until @deck.empty?
      @game_count += 1
      puts "Game " + @game_count.to_s 
      deal
    end
  end

end

