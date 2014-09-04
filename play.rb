require_relative 'card'
require_relative 'hand'
require_relative 'deck'
require_relative 'game'
require 'pry'

  input = nil

  while input != "n"
    game = Game.new
    game.start_game
    print "Play again? "
    input = gets.chomp.downcase
    puts
  end
