class HighCard
  attr_accessor :deck
  SUITS = ["Diamonds", "Clubs", "Spades", "Hearts"]
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

  def winner
    draw = draw_card.split(" ")[0] 
    comp_draw = draw_computer.split(" ")[0] 
    draw_value = VALUES.index(draw) 
    comp_value = VALUES.index(comp_draw)
    if draw_value > comp_value
      @player_score += 1
      puts "Winner! You got the high card!\nPlayer - #{@player_score}\nComputer - #{@comp_score}\nDraw - #{@draw_count}"
    elsif draw_value < comp_value
      @comp_score += 1
      puts "Womp, Womp. Computer got the high card!\nPlayer - #{@player_score}\nComputer - #{@comp_score}\nDraw - #{@draw_count}"
    else 
      @draw_count += 1
      puts "Draw:/\nPlayer - #{@player_score}\nComputer - #{@comp_score}\nDraw - #{@draw_count}"
    end
    puts "*********************"
  end

  def full_deck
    until @deck.empty?
      winner
      @game_count +=1
      puts "Games " + @game_count.to_s 
    end
  end

end

game = HighCard.new
game.full_deck
