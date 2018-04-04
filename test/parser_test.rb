require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser'
require 'pry'

class ParserTest < Minitest::Test

  def setup
    @request_lines = ["GET / HTTP/1.1",
                    "Host: localhost:9292",
                    "Connection: keep-alive",
                    "Cache-Control: no-cache",
                    "User-Agent: Mozilla/5.0
                     (Macintosh; Intel Mac OS X 10_13_3)
                     AppleWebKit/537.36 (KHTML, like Gecko)
                     Chrome/65.0.3325.181 Safari/537.36",
                    "Postman-Token: 2c60fe10-2ff4-5244-291b-c6424a8b7bff",
                    "Accept: */*",
                    "Accept-Encoding: gzip, deflate, br",
                    "Accept-Language: en-US,en;q=0.9"]
    @parser = Parser.new(@request_lines)
  end

  def test_it_exists

    assert_instance_of Parser, @parser
  end

  def test_get_verb
    @parser
    @request_lines

    @parser.get_verb
    assert_equal "GET", @parser.verb
  end

  def test_get_path
    @parser
    @request_lines

    @parser.get_path
    assert_equal "/", @parser.path
  end

  def test_get_protocol
    @parser
    @request_lines

    @parser.get_protocol
    assert_equal "HTTP/1.1", @parser.protocol
  end

  def test_get_host
    @parser
    @request_lines

    @parser.get_host
    assert_equal "localhost", @parser.host
  end

  def test_get_port
    @parser
    @request_lines

    @parser.get_port
    assert_equal "9292", @parser.port
  end

  def test_get_accept
    @parser
    @request_lines

    @parser.get_accept
    assert_equal "Accept: */*", @parser.accept
  end


  # def test_put_remaining_info_into_hash
  #   @parser
  #   @request_lines
  #
  #   @parser.put_remaining_info_into_hash
  #   assert_equal({})
  # end


end



  # assert_equal "Verb: GET\n Path: /\n Protocol: HTTP/1.1\nHost:
  # localhost\nPort: 9292\nOrigin: localhost\n
  # Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\n",
  # parser.parse_diagnostics(request_lines)
  # def test_output_normal
  #   parser = Parser.new
  #   request_lines = "GET / HTTP/1.1
  #                   Host: localhost:9292
  #                   Connection: keep-alive
  #                   Cache-Control: max-age=0
  #                   Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
  #                   Upgrade-Insecure-Requests: 1
  #                   User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36
  #                   Accept-Encoding: gzip, deflate, sdch
  #                   Accept-Language: en-US,en;q=0.8"
  #   assert_equal  [
  #                 "Verb: GET",
  #                 "Path: /",
  #                 "Protocol: HTTP/1.1",
  #                 "Host: localhost",
  #                 "Port: 9292",
  #                 "Origin: localhost",
  #                 "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  #               ], parser.parse_diagnostics(request_lines)
  # end
