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

  def initialize
  
  end
end

class Dealer
  include Hand
 
  def initialize
  
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

  def deal
    2.times do
      p deck.sample
    end
  end
end

class Card 
  def initialize
    
  end
end

class Game
  attr_reader :deck
  
  def initialize
    @deck = Deck.new
  end

  def deal_cards
    deck.deal
  end

  def start
    deal_cards
    #show_initial_cards
    #player_turn
    #dealer_turn
    #show_result
  end
end

Game.new.start

