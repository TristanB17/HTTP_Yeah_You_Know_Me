require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

class ParserTest < Minitest::Test

  def test_it_exists
    parser = Parser.new

    assert_instance_of Parser, parser
  end





end
