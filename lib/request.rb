

class Request
  attr_reader     :request_lines

  def initialize(request_lines)
    @request_lines = request_lines
  end

  def get_verb
    first_line = @request_lines[0].split(" ")
    "Verb: #{first_line[0]}"
  end


end
