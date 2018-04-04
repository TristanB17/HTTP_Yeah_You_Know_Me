require_relative 'response'
require_relative 'server'
require 'pry'

class Parser

  def parse_diagnostics(request_lines)
    verb = request_lines[0].split(" ")[0]
    path = request_lines[0].split(" ")[1]
    protocol = request_lines[0].split(" ")[2]
    host = request_lines[1].split(": ")[1]
    port = request_lines[1].split(":")[2]
    origin = host
    accept = request_lines[4]
    binding.pry
    "Verb: #{verb}\nPath: #{path}\nProtocol: #{protocol}\nHost: #{host}\nPort: #{port}\nOrigin: #{origin}\n#{accept}\n"
  end



end