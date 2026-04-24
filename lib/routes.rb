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
    puts "Detta är resource:#{resource}" 
    section = resource.split('/') 
    # p "#{section}"
    # p "#{section[0]}"
    # p "#{section[1]}"
    # p "#{section[2]}"
    sections = {
      :section => "#{section}"

    }
    # p sections[:section]
    # section << sections
    # p "ALL sections:#{sections}"
    # p "#{sections[:section]}"
    puts "Sections: #{sections}"
    puts "Resource: #{resource}"
    p section[1]
    p section[2]
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

