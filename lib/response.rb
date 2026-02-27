
class Response

  def initialize(status, content_type, content_length, body)
    @status = status
    @content_type = content_type
    @content_length = content_length 
    @body = body

  end

  def to_s
    return "HTTP/1.1 #{@status}\r\nContent-Type#{@content_type}\r\nContent-Length#{@content_length} 
    \r\n\r\n#{@body}"
  end
  






  # def initialize(response_string)

  #     maybe_file = "./lib/#{request.resource}"
  #     # kolla om det finns någon sån fil
  #   if File.exist?(maybe_file)
  #     p "-------+++++++++----------------------------"
  #     p "maybe_file split etc lagra värdet"
  #     p "Filen:#{maybe_file}"
  #     #ganska scuffed solution, ÄNDRA sen!!!!!!!
  #     @filtyp= maybe_file.split(".")
  #     p "Filtyp, typ:#{filtyp[2]}"



  #     #Checkar content type
  #     #images
  #     if @filtyp[2] == "png"
  #       content_type ="image/png"
  #     elsif @filtyp[2] == "jpg"
  #       content_type = "/jpeg"
  #     #text
  #     elsif @filtyp[2] == "css"
  #       content_type = "text/css"
  #     elsif @filtyp[2] == "html"
  #       content_type = "text/html"
  #     elsif @filtyp[2] == "js"
  #       content_type = "text/javascript"
  #     end

  # end





end

