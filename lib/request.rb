
class Request

  attr_reader :resource

  def initialize (request_string)

    line, *lines = request_string.split(/\r?\n/)
   
    @method, @resource, @version = line.split
    
    @headers = {
    }


    i = 0
    while i < lines.length
      key, value = lines[i].split(": ")
      @headers[key] = value
      p key
      p value
      i = i +1
    end 

  end

  
  #p Request.new(File.read("get-examples.request.txt"))
