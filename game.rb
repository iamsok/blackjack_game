require_relative 'card'
require_relative 'hand'
require_relative 'deck'
require 'pry'

class Game
  attr_reader :deck, :player_hand, :dealer_hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
  end

  def let_the_games_begin
    [@player_hand, @dealer_hand].each do |hand|
      deal_cards_to_player(hand, 2)
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_cards_to_player(player, count=1)
    count.times do
      player.add_card(deck.deal_card)
    end
  end

  def hand_dealt(card)
    puts "\nwas dealt #{card}"
  end

  def score(hand)
    puts "score: #{hand.score}\n"
  end

  def play
    print "Hit or Stand (h/s): "
    input = gets.chomp.downcase
    if  input == "h"
      card = deck.deal_card
      player_hand.add_card(card)
      hand_dealt(card)
      score(player_hand)
      play
    elsif input == "s"
      score(player_hand)
    else
      puts "Please select (h)it or (s)tay\n"
      play
    end
  end

  def dealer_play
    if dealer_hit?
      card = deck.deal_card
      dealer_hand.add_card(card)
      hand_dealt(card)
      score(dealer_hand)
      dealer_play
    end
  end

  def dealer_hit?
    dealer_hand.score < 17
  end

  def start_game
    puts "Welcome to Casino de Peter"
    puts "Min: $100.00 Max: $5,000.00"
    puts "Dealer Must Hit Soft 17"
    puts "Blackjack Pays 3 to 2"
    puts "Please place your bets\n"
    if dealer_hit?
      dealer_hand.card
    end
  end

end
game = Game.new
binding.pry
