require 'pry'

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def is_face?
    @value == 'K' || @value == 'Q' || @value == 'J'
  end

  def is_ace?
    @value == 'A'
  end

  def is_value?
    !self.is_ace? && !self.is_face?
  end
end

