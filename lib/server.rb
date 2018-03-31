require 'socket'
require 'pry'

class Server

  def initialize
    @tcp_server = TCPServer.new(9292)
    count = 0
  end

  def counts_when_server_accepts
    while @tcp_server = true
      client = tcp_server.accept
      count += 1
      request_lines = []
    end
  end

  def request_lines_get_compounded
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
  end

  def output_monitoring
    output = "Hello World! (#{count})"
    response = request_lines
    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    client.puts output
    client.puts response
    client.puts headers
    puts [output, response, headers].join("\n")
    client.close
    end
end
