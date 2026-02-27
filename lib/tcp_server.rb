require 'socket'
require_relative 'request'
require_relative 'response'

class HTTPServer

  def initialize(port)
    @port = port
  end

  def start
    server = TCPServer.new(@port)
    puts "Listening on #{@port}"

    while session = server.accept
      #Request
      data = ''
      while line = session.gets and line !~ /^\s*$/
        data += line
      end
      puts "RECEIVED REQUEST"
      puts '-' * 40
      puts data
      puts '-' * 40

      request = Request.new(data)

          maybe_file = "./lib/#{request.resource}"
          
      # kolla om det finns någon sån fil
      if File.exist?(maybe_file)
        p "-------+++++++++----------------------------"
        p "maybe_file split etc lagra värdet"
        p "Filen:#{maybe_file}"
        #ganska scuffed solution, ÄNDRA sen!!!!!!!
        filename, filtyp = maybe_file.split(".")
        p "Filtyp, typ:#{filtyp[2]}"
        
        
        

        #klassmetod i prog2-boken
        #content_type = MimeType.for(filtyp)
      
      #Checkar content type
        #images
        # if filtyp == "png"
        #   content_type ="image/png"
        # elsif filtyp == "jpg"
        #   content_type = "/jpeg"
        # #text
        # elsif filtyp == "css"
        #   content_type = "text/css"
        # elsif filtyp == "html"
        #   content_type = "text/html"
        # elsif filtyp == "js"
        #   content_type = "text/javascript"
        # end

        
        @resource = request.resource
        body = File.binread("./lib#{@resource}")
        content_length = body.bytesize        

        status = "200 OK"
      else
        body = "<h1>WAT</h1>
                <h2>Could not find page<h2>"
        status = "404 NOT FOUND"
      end

      response = Response.new(status, content_type, content_length, body)

      session.print response.to_s
      #session.print "HTTP/1.1 #{status}\r\nContent-Type: #{content_type}\r\nContent-Length: #{content_length}\r\n\r\n#{body}"
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start
