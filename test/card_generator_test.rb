require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
    def setup

  end

    def test_it_exists_and_has_attributes
    file_name = './data/cards.txt'
    cards = CardGenerator.new(file_name).create_card
  end
end