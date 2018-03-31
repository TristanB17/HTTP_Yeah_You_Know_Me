require 'socket'

class Server

  def initialize
    tcp_server = TCPServer.new(9292)
    count = 0
      while true
      client = tcp_server.accept
      count += 1
      request_lines = []
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end
      output = "Hello World! (#{count})"
      response = request_lines[0].split,
                 request_lines[1].split,
                 request_lines[2].split
      headers = ["http/1.1 200 ok",
                "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                "server: ruby",
                "content-type: text/html; charset=iso-8859-1",
                "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      client.puts headers
      client.puts response
      client.puts output

      puts [headers, response, output].join("\n")
    end

      client.close
  end
end
