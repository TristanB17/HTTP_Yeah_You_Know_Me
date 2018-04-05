require_relative 'response'
require_relative 'server'
require 'pry'

class Parser
  attr_reader :request_lines,
              :verb,
              :path,
              :protocol,
              :host,
              :port,
              :accept

  def initialize(request_lines)
    @request_lines = request_lines
    @verb = request_lines[0].split(" ")[0]
    @path = get_path
    @protocol = get_protocol
    @host = get_host
    @port = get_port
    @origin = @host
    @accept = get_accept
  end

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
    @request_lines[1].split(":")[1].strip
  end

  def get_port
    @request_lines[1].split(":")[2]
  end

  def get_accept
    @request_lines.select do |line|
      return line if line.start_with?("Accept")
    end
  end

  def homepage
    puts "Verb:#{@verb}"
    puts "Path: #{@path}"
    puts "Protocol: #{@protocol}"
    puts "Host:#{@host}"
    puts "Port: #{@port}"
    puts "Origin:#{@origin}"
    puts "#{@accept}"
  end

end
