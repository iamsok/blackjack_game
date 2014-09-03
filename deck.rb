require_relative 'card'
require 'pry'

class Deck
  attr_accessor :deck

SUITS = ['♥', '♦', '♠', '♣']
FACES = ['K', 'Q', 'J', 'A']

  def initialize
    @deck = make_deck
  end

  def make_deck
    deck = []
    SUITS.each do |suit|
      (2..10).each do |value|
        deck << Card.new(value, suit)
      end
      FACES.each do |value|
        deck << Card.new(value, suit)
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
