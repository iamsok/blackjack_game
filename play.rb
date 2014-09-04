require_relative 'card'
require_relative 'hand'
require_relative 'deck'
require_relative 'game'
require 'pry'

  input = nil

  def prompt
    print "Play again? "
    input = gets.chomp.downcase
    input
  end

  while input != "n"
    game = Game.new
    game.start_game
    input = prompt
    puts
  end
