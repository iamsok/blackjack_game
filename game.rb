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

  def initial_deal
    [@player_hand, @dealer_hand].each do |hand|
      deal_cards_to_player(hand, 2)
    end
    @player_hand.cards.each do |card|
      puts hand_dealt(card, "Player")
    end
    puts score(@player_hand, "Player")
    dealer_card = @dealer_hand.cards[0]
    puts hand_dealt(dealer_card, "Dealer")
  end


  def deal_cards_to_player(player, count=1)
    count.times do
      player.add_card(deck.deal_card)
    end
  end

  def hand_dealt(card, name)
    "#{name} dealt #{card}"
  end

  def score(hand, name)
    "#{name} score: #{hand.score}\n\n"
  end

  def bust?(hand)
    hand.score > 21
  end

  def play
    input = nil
    while input != 's'
      print "\nHit or Stand (h/s): "
      input = gets.chomp.downcase
      if  input == "h"
        card = deck.deal_card
        player_hand.add_card(card)
        puts hand_dealt(card, "Player")
        puts score(player_hand, "Player")
        if bust?(player_hand)
          puts "Bust! You lose."
          break
        end
      elsif input == "s"
        puts score(player_hand, "Player")
      else
        puts "Please select (h)it or (s)tay\n"
      end
    end
  end

  def dealer_play
    if !bust?(@player_hand)
      @dealer_hand.cards.each do |card|
        puts hand_dealt(card, "Dealer")
      end
      puts score(@dealer_hand, "Dealer")

      while dealer_hit?
        card = deck.deal_card
        dealer_hand.add_card(card)
        puts hand_dealt(card, "Dealer")
        puts score(dealer_hand, "Dealer")
      end
    end
  end

  def dealer_hit?
    dealer_hand.score < 17
  end

  def who_wins
    if !bust?(player_hand)
      if player_hand.score > dealer_hand.score
        "You Win!"
      else
        "You Lose!"
      end
    end
  end

  def start_game
    puts "Welcome to Casino de Peter"
    puts "Min: $100.00 Max: $5,000.00"
    puts "Dealer Must Hit Soft 17"
    puts "Blackjack Pays 3 to 2"
    puts "Please place your bets\n\n"
    initial_deal
    play
    dealer_play
    who_wins
  end

end


