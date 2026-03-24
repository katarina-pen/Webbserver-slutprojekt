class Router 
    
  def initialize
      @routes = [
    { method: "GET", resource: "/", html: "<h1>Välkommen!</h1>" },
    { method: "GET", resource: "/hello", html: "<h1>Hello!</h1>" }
    ]   
  end


  def match(request)
    @resultRoute = @routes.find {|route| route[:resource] == request.resource}
  end


  def add_route(method, resource, html)
    routeHash = {:method => method, :resource => resource, :html => html}
    @routes << routeHash

  end






  
end