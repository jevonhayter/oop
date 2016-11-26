module Hand
  def hit(cards)
    cards << deal_a_card
  end

  def stay(cards)
    total(cards)
  end

  def busted?(cards)
    total(cards) > 21
  end

  def total(cards) 
    values = cards.map { |card| card[1] } 

    sum = 0 
    values.each do |value| 
     if value.include?('A')
      sum += 11 
     elsif value.to_i == 0 # J, Q, K 
       sum += 10 
     else 
       sum += value.to_i 
     end 
    end 

    # correct for Aces 
    values.select { |value| value == 'A' }.count.times do 
     sum -= 10 if sum > 21 
    end 

    sum 
  end 
end

class Player
  include Hand

  attr_reader :name
  attr_accessor :cards
  def initialize(cards, name)
    @cards = cards
    @name = name
  end
end

class Dealer
  include Hand

  attr_reader :deck
  attr_accessor  :cards, :player_cards, :player
  def initialize
    @deck = Deck.new
    @cards = Card.new
    @player_cards = Card.new
  end

  def deal
    2.times do
      cards << deck.pop
      player_cards << deck.pop
    end
    @player = Player.new(player_cards, "Jae")
  end

  def to_s
    @player_cards.to_s
    @cards.to_s
  end

  def deal_a_card
    deck.pop
  end
end


class Deck
  SUITS = %w(H D S C).freeze
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_reader :deck
  def initialize
    @deck = SUITS.product(VALUES).shuffle
  end

  def pop
    deck.pop
  end
end

class Card
  attr_accessor :card

  def initialize
    @card = []
  end

  def <<(other)
    card << other
  end

  def to_s
    card.to_s
  end

  def map(&block)
    card.map(&block)
  end
end

class Game
  attr_reader :dealer

  def initialize
    @dealer = Dealer.new
  end

  def player_card_value
    dealer.player.total(dealer.player_cards)
  end

  def dealer_card_value
    dealer.total(dealer.cards)
  end


  def detect_result(dealer_cards, player_cards)
    player_total = dealer.total(player_cards)
    dealer_total = dealer.total(dealer_cards)

    if player_total > 21
      :player_busted
    elsif dealer_total > 21
      :dealer_busted
    elsif dealer_total < player_total
      :player
    elsif dealer_total > player_total
      :dealer
    else
      :tie
    end
  end

  def display_result(dealer_cards, player_cards)
    result = detect_result(dealer_cards, player_cards)

    case result
    when :player_busted
      puts 'You busted! Dealer wins!'
    when :dealer_busted
      puts 'Dealer busted! You win!'
    when :player
      puts 'You win!'
    when :dealer
      puts 'Dealer wins!'
    when :tie
      puts "It's a tie!"
    end
  end

  def deal_cards
    dealer.deal
    dealer.cards
    dealer.player_cards
  end

  def show_initial_cards
    puts "#{dealer.player.name} has #{dealer.player_cards} for a total amount of: #{player_card_value}"
    puts ""
    puts "Dealer has #{dealer.cards} for a total amount of: #{dealer_card_value} "
    puts ""
  end

  def player_turn
    loop do
      puts "#{dealer.player.name} would you like a (h)it or (s)tay?"

      answer = nil
      loop do
        answer = gets.chomp.downcase
        break if %w(h s).include? answer
        puts "Please choose to Hit(h) or Stay(s)!"
      end
      
      if answer == "h"
        dealer.hit(dealer.player.cards)
        puts "You chose to hit!"
        puts "Your cards are now: #{dealer.player_cards}"
        puts "Your total is now: #{dealer.total(dealer.player_cards)}"
      end

      break if answer == 's' || dealer.busted?(dealer.player.cards)
    end

    if dealer.busted?(dealer.player.cards)
      display_result(dealer.cards, dealer.player_cards)
      exit
    else
      puts "You stayed at #{dealer.stay(dealer.player.cards)}"
    end
  end

  def dealer_turn
    puts 'Dealer turn...'

    loop do
      break if dealer.busted?(dealer.cards) || dealer.total(dealer.cards) >= 17

      puts 'Dealer hits!'
      dealer.hit(dealer.cards)
      puts "Dealer's cards are now: #{dealer.cards}"
    end

    if dealer.busted?(dealer.cards)
      puts "Dealer total is now: #{dealer.total(dealer.cards)}"
      display_result(dealer.cards, dealer.player_cards)
      exit
    else
      puts "Dealer stays at #{dealer.total(dealer.cards)}"
    end
  end

  def show_result
     # both player and dealer stays - compare cards!
    puts '=============='
    puts "Dealer has #{dealer.cards}, for a total of: #{dealer.total(dealer.cards)}"
    puts "Player has #{dealer.player_cards}, for a total of: #{dealer.total(dealer.player_cards)}"
    puts '=============='

    display_result(dealer.cards, dealer.player_cards)
  end

  puts 'Thank you for playing Twenty-One! Good bye!'

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end
Game.new.start