require 'socket'
require_relative 'request'
require_relative 'response'

class HTTPServer

  def initialize(port)
    @port = port
    @routes = [
    { resource: "/", html: "<h1>Välkommen!</h1>" },
    { resource: "/hello", html: "<h1>Hello!</h1>" }
    ]
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

      
      resultRoute = @routes.find {|route| route[:resource] == request.resource}
      x = 1
      if resultRoute    
        body = resultRoute[:html]
      elsif File.exist?(maybe_file)
        p "-------+++++++++----------------------------"
        p "maybe_file split etc lagra värdet"
        p "Filen:#{maybe_file}"
        filename, filtyp = maybe_file.split(".")
        p "Filtyp, typ:#{filtyp[2]}"
        
        @resource = request.resource
        body = File.binread("./lib#{@resource}")
        content_length = body.bytesize        
        status = "200 OK"
      else
        body = "<h1>WAT</h1>
                <h2>Could not find page<h2>"
        status = "404 NOT FOUND"
      end

    

      response = Response.new(status, filtyp, content_length, body)

      session.print response.to_s
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start
