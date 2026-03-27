require 'socket'
require_relative 'request'
require_relative 'response'
require_relative 'routes'


class HTTPServer

  def initialize(port, router)
    @port = port
    @router = Router.new
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
      resultRoute = @router.match(request)


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