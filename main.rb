# main.rb
require_relative 'game'

def main
  game = Mastermind.new
  game.initial_screen
  game.the_game
end

main
