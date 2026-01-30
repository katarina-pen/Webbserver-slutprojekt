
class Request

  attr_reader :resource

  def initialize (request_string)

    line, *lines = request_string.split(/\r?\n/)
   
    @method, @resource, @version = line.split
    
    @headers = {
    }

    

    i = 0
    while i < lines.length && lines[i] != [""]
      key, value = lines[i].split(": ")
      @headers[key] = value
      p key
      p value
      i = i +1
    end 

    

  end

end

#p "Jag körs i: #{Dir.pwd()}"
#p Dir.entries("./handout/1 - example_requests")
#p Request.new(File.read("./handout/1 - example_requests/get-fruits-with-filter.request.txt"))
