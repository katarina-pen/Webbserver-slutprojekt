
class Request

  def initialize (request_string)
    @daString = request_string.split("\r\n")

  end
  
  def method
    @method = daString[0]
  end

  def resource
    @resource =daString[1]
  end

  def version
    @version = daString[2]
  end

  def headers
    @headers = daString[3]
  end

  def params
    @params = daString[4]
  end

  

end