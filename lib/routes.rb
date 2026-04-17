class Router 
    
  def initialize
      @routes = [
    ]   
  end


  def match(request)
    @routes.find {|route| route[:resource] == request.resource}
  end


  def get(resource, &block)
    add_route("GET", resource, block)    
  end

  def post(resource, &block)
    add_route("POST", resource, block)
  end

  private 
  def add_route(method, resource, block)
    routeHash = {:method => method, :resource => resource, :block => block}
    @routes << routeHash

  end



  
end