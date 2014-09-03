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
    puts "was dealt #{card}"
  end

  def score(hand)
    puts "score: #{hand.score}\n\n"
  end

  def play
    print "\nHit or Stand (h/s): "
    input = gets.chomp.downcase
    if  input == "h"
      card = deck.deal_card
      player_hand.add_card(card)
      hand_dealt(card)
      score(player_hand)
      bust?
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
    puts "Please place your bets"
    puts
  end

  def bust?
    if score > 21
      puts "Sorry you have busted!"
      break
    end
  end
end
game = Game.new

game.start_game
game.deck.shuffle!

game.let_the_games_begin

game.player_hand.cards.each do |card|
  print "Player "
  game.hand_dealt(card)
end
print "Player "
game.score(game.player_hand)
print "Dealer "
game.hand_dealt(game.dealer_hand.cards[0])

game.play

game.dealer_hand.cards.each do |card|
  print "Dealer "
  game.hand_dealt(card)
end
print "Dealer "
game.score(game.dealer_hand)
game.dealer_play

