require 'pry'
require_relative 'parser'


class Response
  attr_reader :request_lines,
              :verb,
              :path


    def initialize
      @response = Parser.new(request_lines)
    end

  # def initialize(request_lines)
  #   @request_lines = request_lines
  #   @verb = first_line[0]
  #   @path = first_line[1]
  #   @protocol = first_line[2]
  #   @host = get_host[1]
  #   @port = @request_lines[1]
  #   @origin = get_host[1]
  #   @accept = @request_lines[6]
  # end

  # def first_line
  #   @request_lines[0].split(" ")
  # end
  #
  # def get_host
  #   @request_lines[1].split(": ")
  # end
  #
  # def get_port
  #   @host.split(":")
  # end
  #
  # def get_accept
  #   @request_lines[4].split(": ")
  # end
  #
  # def print_diagnostics
  #   print "Verb: #{@verb}\n"
  #   print "Path: #{@path}\n"
  #   print "Protocol: #{@protocol}\n"
  #   print "Host: #{@host}\n"
  #   print "Port: #{@port}\n"
  #   print "Origin: #{@origin}\n"
  #   print "#{@accept}\n"
  # end


end
