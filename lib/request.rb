
class Request
  attr_reader     :request_lines

  def initialize(request_lines)
    @request_lines = request_lines
    first_line = @request_lines[0].split(" ")
    @verb = first_line[0]
    @path = first_line[1]
    @protocol = first_line[2]
    get_host = @request_lines[1].split(": ")
    @host = get_host[1]
    get_port = @host.split(":")
    @port = get_port[1]
    @origin = get_host[1]
    get_accept = @request_lines[4].split(": ")
    @accept = get_accept[1]
    print "Verb: #{@verb}\n"
    print "Path: #{@path}\n"
    print "Protocol: #{@protocol}\n"
    print "Host: #{@host}\n"
    print "Port: #{@port}\n"
    print "Origin: #{@origin}\n"
    print "Accept: #{@accept}\n"
  end

  def get_verb
    first_line = @request_lines[0].split(" ")
    "Verb: #{first_line[0]}"
  end


end
