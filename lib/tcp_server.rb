require 'socket'
require_relative 'request'
require_relative 'response'
require_relative 'routes'


class HTTPServer

  def initialize(port)
    @port = port
    # @routes = [
    # { resource: "/", html: "<h1>Välkommen!</h1>" },
    # { resource: "/hello", html: "<h1>Hello!</h1>" }
    # ]
  end


   #r.add_route("GET", "/wat", "<h1>WAT</h1>")




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

      r = Router.new


      maybe_file = "./lib/#{request.resource}"

      #letar efter en route som matchar request
      #resultRoute = @routes.find {|route| route[:resource] == request.resource}
      
      resultRoute = r.match(request)

      if resultRoute    
        body = resultRoute[:html]
        filtyp = "html"
        status = "200 OK"
      elsif File.exist?(maybe_file)
        p "-------+++++++++----------------------------"
        p "maybe_file split etc lagra värdet"
        p "Filen:#{maybe_file}"
        nada, filename, filtyp = maybe_file.split(".")
        p "Filtyp #{filtyp}"

        @resource = request.resource
        body = File.binread("./lib#{@resource}")
        status = "200 OK"
      else
        body = "<h1>WAT</h1>
                <h2>Could not find page<h2>"
        filtyp = "html"
        status = "404 NOT FOUND"
      end
      
      content_length = body.bytesize
    

      response = Response.new(status, filtyp, content_length, body)

      session.print response.to_s
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start
x=1