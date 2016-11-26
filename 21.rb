require 'pry'

module Hand
  def hit(cards)
    cards << deck.deal_a_card
    cards
  end

  def stay
  end

  def busted?
  end

  def total(cards) 
    # definitely looks like we need to know about "cards" to produce some total
   
    # cards = [['H', '3'], ['S', 'Q'], ... ] 
   
   values = cards.map { |card| card[1] } 
 
   sum = 0 
   values.each do |value| 
     if value == "A" 
      sum += 11 
     elsif value.to_i == 0 # J, Q, K 
       sum += 10 
     else 
       sum += value.to_i 
     end 
   end 
 
   # correct for Aces 
   values.select { |value| value == "A" }.count.times do 
     sum -= 10 if sum > 21 
   end 
 
   sum 
 
  end 

  def dealt_cards
    deck.cards
  end
end


class Player
  include Hand
  attr_accessor :deck
  attr_reader :name

  def initialize(name)
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
    @deck = Deck.new
    @name = name
  end
end

class Dealer
  include Hand
  attr_accessor :deck
  
  def initialize
    @deck = Deck.new
    # seems like very similar to Player... do we even need this?
  end
end

class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :deck, :cards
  
  def initialize
    @deck = SUITS.product(VALUES).shuffle
    @cards = Card.new
  end

  def deal
   self.cards = [] 
   
   2.times do 
    cards << deck.pop
   end
   
   cards
  end

  def deal_a_card
    deck.pop
  end

  def to_s
    deck.to_s
  end
end

class Card
  attr_accessor :cards

  def initialize
    # what are the "states" of a card?
    @cards = []
  end
end

class Game
  attr_reader :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new("Jae") 
  end

  def player_card_value
    player.total(player.dealt_cards)
  end

  def dealer_card_value
    dealer.total(dealer.dealt_cards)
  end

  def deal_cards
    player.deck.deal
    dealer.deck.deal
  end

  def show_initial_cards
    puts "#{player.name} has #{player.deck.cards} for a total amount of: #{player_card_value}"
    puts "Dealer has #{dealer.deck.cards} for a total amount of: #{dealer_card_value}"
    ""
    ""
  end

  def player_turn
    puts "#{player.name} would you like a Hit (h) or Stay (s) ?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      puts "Please choose to Hit(h) or Stay(s)!"
    end
    answer

    if answer.include?("h")
      p player.hit(player.deck.cards)
      p player.total(player.hit(player.deck.cards))
    end
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    #dealer_turn
    #show_result
  end
end

Game.new.start