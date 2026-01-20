
class Request

  def initialize (request_string)

    line, *lines = request_string.split(/\r?\n/)
   
    # p line.split
    # @method, @resource, @version = line.split
    # p @method
    # p @resource
    # p @version
    
    p lines
    
    headers = {
    }

    key, value = lines[0].split(": ")
    headers[key] = value
    
    p headers

    i = 0
    p i
    while i > lines.length
      
      puts lines[i]
      i = i + 1
    end
    

  
  end

  

end

Request.new(File.read("get-examples.request.txt"))