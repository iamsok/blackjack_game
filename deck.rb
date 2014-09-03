require_relative 'card'
require 'pry'

class Deck

SUITS = ['♥', '♦', '♠', '♣']
FACES = ['K', 'Q', 'J', 'A']
  def initialize
    @deck = make_deck
  end

  def make_deck
    deck = []
    SUITS.each do |suit|
      (2..10).each do |value|
        deck << Card.new(suit, value)
      end
      FACES.each do |face|
        deck << Card.new(suit, face)
      end
    end
    deck
  end

  def shuffle!
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end
end
