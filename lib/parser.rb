require_relative 'response'
require_relative 'server'
require 'pry'

class Parser
  attr_reader :request_lines,
              :verb,
              :path,
              :protocol,
              :host

  def initialize(request_lines)
    @request_lines = request_lines
    @response_lines_hash = {}
    @verb = get_verb
    @path = get_path
    @protocol = get_protocol
    @host = get_host
  end

  # module Diagnostics
  #   @response_lines_hash = {}
  #   @verb = get_verb
  #   @path = get_path
  #   @protocol = get_protocol
  #   @host = get_host
  # end

  # def parse_diagnostics(request_lines)
  #   verb = request_lines[0].split(" ")[0]
  #   path = request_lines[0].split(" ")[1]
  #   protocol = request_lines[0].split(" ")[2]
  #   host = request_lines[1].split(":")[1]
  #   port = request_lines[1].split(":")[2]
  #   origin = host
  #   accept = request_lines[4].split(" ")[1]
  #   "\nVerb: #{verb}\nPath: #{path}\nProtocol: #{protocol}\nHost:#{host}\nPort: #{port}\nOrigin:#{origin}\nAccepts: #{accept}\n"
  # end

  def get_verb
    @request_lines[0].split(" ")[0]
  end

  def get_path
    @request_lines[0].split(" ")[1]
  end

  def get_protocol
    @request_lines[0].split(" ")[2]
  end

  def get_host
    @request_lines[1].split(":")[1]
  end


end
