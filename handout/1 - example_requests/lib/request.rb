
class Request

  def initialize (request_string)
    line, *lines = request_string.split(/\r?\n/)
    method, resource, version = line.split
    p method
    p resource
    p lines

  
  end

  

end

Request.new(File.read("get-examples.request.txt"))