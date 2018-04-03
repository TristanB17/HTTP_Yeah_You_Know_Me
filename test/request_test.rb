require 'minitest/autorun'
require 'minitest/pride'
require './lib/request'

class RequestTest < Minitest::Test

  def setup
    @request_lines = [
      "http/1.1 200 ok",
      "date: Mon,  2 Apr 2018 14:58:29 -0600",
      "server: ruby",
      "content-type: text/html; charset=iso-8859-1",
      "content-length: 16"
    ]
    @request = Request.new(@request_lines)
  end

  def test_it_exists
    assert_instance_of Request, @request
  end

  def test_verb_retrieval
    @request = Request.new(request_lines)



end
