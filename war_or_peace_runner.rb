require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'


game = Game.new('./data/cards.txt')
game.start