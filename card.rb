require 'pry'

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
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

  def to_s
    "#{@value}#{@suit}"
  end
end


