require 'minitest/autorun'
require 'minitest/pride'
require './lib/request'

class RequestTest < Minitest::Test

  def setup
    @request_lines = [
      "GET / HTTP/1.1
      Host: localhost:9292
      Connection: keep-alive
      Cache-Control: max-age=0
      Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
      Upgrade-Insecure-Requests: 1
      User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36
      Accept-Encoding: gzip, deflate, sdch
      Accept-Language: en-US,en;q=0.8"
    ]
    @request = Request.new(@request_lines)
  end

  def test_it_exists
    assert_instance_of Request, @request
  end

  def test_attributes
    assert_equal @request_lines, @request.request_lines
    assert_equal "GET", @request.verb
  end



end
