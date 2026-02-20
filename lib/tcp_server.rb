require 'socket'
require_relative 'request'

class HTTPServer

  def initialize(port)
    @port = port
  end

  def start
    server = TCPServer.new(@port)
    puts "Listening on #{@port}"

    while session = server.accept
      data = ''
      while line = session.gets and line !~ /^\s*$/
        data += line
      end
      puts "RECEIVED REQUEST"
      puts '-' * 40
      puts data
      puts '-' * 40

      request = Request.new(data)




      # p request


      # kolla om det finns någon sån fil öht
      maybe_file = "./lib/#{request.resource}"
      if File.exist?(maybe_file)
        p "-------+++++++++----------------------------"
        p "maybe_file split etc lagra värdet"
        p "Filen:#{maybe_file}"
        #ganska scuffed solution, ÄNDRA sen!!!!!!!
        filtyp= maybe_file.split(".")
        p "Filtyp, typ:#{filtyp[2]}"
        #Checkar content type
        #images
        if filtyp[2] == "png"
          content_type ="image/png"
        elsif filtyp[2] == "jpg"
          content_type = "text/jpeg"
        #text
        elsif filtyp[2] == "css"
          content_type = "text/css"
        elsif filtyp[2] == "html"
          content_type = "text/html"
        elsif filtyp[2] == "js"
          content_type = "text/javascript"
        end

        
        @resource = request.resource
        body = File.read("./lib#{@resource}")
        
        #Vad var det för typ fil?
        

        content_type = "text/html"
        status = "200 OK"
      else
        body = "<h1>WAT</h1>
                <h2>Could not find page<h2>"
        status = "404 NOT FOUND"
      end


      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: #{content_type}\r\n"
      session.print "\r\n"
      session.print body
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start
