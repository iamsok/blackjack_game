require_relative 'card'
require_relative 'hand'
require_relative 'deck'
require_relative 'game'
require 'pry'

  input = nil

  def prompt
    print "Play again? "
    input = gets.chomp.downcase
    while input != 'n' && input != 'y'
      print "Please enter y or n: "
      input = gets.chomp.downcase
    end
    input
  end

  while input != "n"
    game = Game.new
    game.start_game
    input = prompt
  end
