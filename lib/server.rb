require 'socket'
require_relative 'response'
require_relative 'parser'
require 'pry'
# require 'printer'

class Server

  def initialize
    @tcp_server = TCPServer.new(9292)
    @count = 0
    @request_lines = []
  end

  def start
    while true
      # .accept creats a 'listener' for tcp_server on port 9292,
      # assigns to client
      connection = @tcp_server.accept
      # receives_request gets client, creates get request
      #(HTTP verb, path, protocol, etc) and chomps new line
      #takes request_lines
      @request_lines = receive_request(connection)
      path = @request_lines[0].split[1]
      request = Parser.new(@request_lines)
      if path == "/hello"
        output = "<html>Hello World! (#{@count})#{request.verb}</html>"
      end
      output
      headers = ["http/1.1 200 ok"]
          # "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          # "server: ruby",
          # "content-type: text/html; charset=iso-8859-1",
          # "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      connection.puts headers
      connection.puts request.homepage
      connection.puts output
      puts [headers, request.homepage, output].join("\n")
      connection.close
    end
  end

  def receive_request(connection)
    @count += 1
    while line = connection.gets and !line.chomp.empty?
      @request_lines << line.chomp
    end
    @request_lines
  end


end
