require 'pry'

module Hand
  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Player
  include Hand

  attr_accessor :cards, :name

  def initialize(name)
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
    @cards = Card.new
    @name = name
  end

  def to_s
    @cards.to_s
  end
end

class Dealer
  include Hand
 
  attr_accessor :deck, :player, :dealer_cards
 
  def initialize
    # seems like very similar to Player... do we even need this?
    @deck = Deck.new
    @player = Player.new("Jae")
    @dealer_cards = Card.new
  end
 
  def deal
    2.times do
      player.cards << deck.deal_a_card
      dealer_cards << deck.deal_a_card
    end
  end
end

class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :deck
  
  def initialize
    @deck = SUITS.product(VALUES).shuffle
  end
  
  def deal_a_card
    deck.pop
  end
end

class Card 
  attr_accessor :cards
 
  def initialize
    # what are the "states" of a card?
    @cards = []
  end

  def <<(other)
    cards << other
  end

  def to_s
    @cards.to_s
  end
end

class Game
  attr_reader :dealer
 
  def initialize
    @dealer = Dealer.new
  end
 
  def deal_cards
    dealer.deal
  end

  def show_initial_cards
    puts "Player has #{dealer.player.cards}"
    puts "Dealer has #{dealer.dealer_cards}"
  end

  def start
    deal_cards
    show_initial_cards
    #player_turn
    #dealer_turn
    #show_result
  end
end

Game.new.start

