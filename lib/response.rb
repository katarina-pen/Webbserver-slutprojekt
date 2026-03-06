
require_relative 'mimetype'

class Response

  def initialize(status, filtyp, content_length, body)
    @status = status
    @content_type = MimeType.for(filtyp)
    @content_length = content_length 
    @body = body

  end

  def to_s
    return "HTTP/1.1 #{@status}\r\nContent-Type: #{@content_type}\r\nContent-Length: #{@content_length}\r\n\r\n#{@body}"
  end
  
end

  routes = [
        { resource: "/", html: "<h1>Välkommen!</h1>" },
        { resource: "/hello", html: "<h1>Hello!</h1>" }
    ]

routes.each do |i|
        puts i
      end