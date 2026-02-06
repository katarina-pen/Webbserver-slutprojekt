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
      if File.exist?("./lib/#{request.resource}")
      #if request.resource == "/hello.html"
        # html = "<h1>Hello, World!</h1>
        #         <h4> hi </h4>"
        @resource = request.resource
        html = File.read("./lib/#{@resource}")
        
        #Vad var det för typ fil?
        
        content_type = "text/html"
        status = "200 OK"
      else
        html = "<h1>WAT</h1>
                <h2>Could not find page<h2>"
        status = "404 NOT FOUND"
      end


      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: #{content_type}\r\n"
      session.print "\r\n"
      session.print html
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start
