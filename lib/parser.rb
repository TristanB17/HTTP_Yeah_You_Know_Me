require_relative 'response'
require_relative 'server'
require 'pry'

class Parser

  def parse_diagnostics(request_lines)
    verb = request_lines[0].split(" ")[0]
    path = request_lines[0].split(" ")[1]
    protocol = request_lines[0].split(" ")[2]
    host =  request_lines.find do |line|
      if line.start_with?("Host:")
      line[0].split(":")[1].strip
      end
    end
    port = request_lines.find do |line|
      if line.start_with?("Host:")
      line[0].split(":")[2]
      end
    end
    origin = host
    accept = request_lines.find do |line|
      if line.start_with?("Accept: ")
        line
      end
    end
    "Verb: #{verb}\nPath: #{path}\nProtocol: #{protocol}\nHost: #{host}\nPort: #{port}\nOrigin: #{origin}\n#{accept}\n"
  end



end
