require_relative 'tcp_server'
require_relative 'routes'


#Routes🤯
r = Router.new
r.get("/wat2", "<h1>WAT2</h1>")




server = HTTPServer.new(4567, @router)
server.start