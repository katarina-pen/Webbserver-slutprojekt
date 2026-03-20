class Router 
    
  def match(request)
    @routes = [
    { resource: "/", html: "<h1>Välkommen!</h1>" },
    { resource: "/hello", html: "<h1>Hello!</h1>" }
    ] 
    @resultRoute = @routes.find {|route| route[:resource] == request.resource}

  end


  def add_route(method, resource, html)
      
    
  end






  
end