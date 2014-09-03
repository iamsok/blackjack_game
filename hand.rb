require_relative 'card'
require 'pry'


class Hand
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def add_cards(card)
    @hand << card
  end

  def score
    score = 0
    ace_counter = 0

    @hand.each do |card|
      if card.is_face?
        score += 10
      elsif card.is_value?
        score += card.value
      elsif card.is_ace?
        score += 11
        ace_counter += 1
      end
      if score > 21
        score -= (ace_counter) * 10
      end
    end
    score
  end
end

Card.new('♥', 5)
# cards = [Card.new('♥', 5),Card.new('♥', 5),Card.new('♥', 5)]
# hand = Hand.new(cards)
hand2 = Hand.new([Card.new('♥', 'A'),Card.new('♥', 5),Card.new('♥', 5)])
hand3 = Hand.new([Card.new('♥', 'K'),Card.new('♥', 'Q'),Card.new('♥', 'A')])

binding.pry
