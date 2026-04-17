require_relative 'tcp_server'
require_relative 'routes'


#Routes🤯
r = Router.new
r.get("/wat2") do
    "<h1>#{Time.now}</h1>"
end
#r.get("/", "<h1>slash</h1>")
#r.get("/hello", "<h1>Hello!2</h1>")

r.get("/users/:id") do |id|
      "Hej #{id}!"
end


server = HTTPServer.new(4567, r)
server.start

x=1