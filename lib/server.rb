require 'socket'
require_relative 'response'

class Server

  def initialize
    tcp_server = TCPServer.new(9292)
    count = 0
      while true
      client = tcp_server.accept
      count += 1
      request_lines = []
      end
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end
      request = Response.new(request_lines)
      if request.verb == "GET"
        output = "Hello World! (#{count})"
      end
        headers = ["http/1.1 200 ok",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")
          client.puts headers
          client.puts request.print_diagnostics
          client.puts output

      puts [headers, request.print_diagnostics, output].join("\n")
      client.close
  end
end
