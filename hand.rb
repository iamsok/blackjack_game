require_relative 'card'
require 'pry'


class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def add_card(card)
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


