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
    # puts "SECTION: #{section}"
   
    
    # section = {
    #   # :section => "#{section}"
    #   :section => 
       
      section.each do |i|
        hash = Hash [:section]=>[*section]
        puts "array #{i}" 
        puts hash.inspect
      end
      
      p section

        section.each do |i|  
          hash = Hash.new
          :section => section
          
        end

   


    # }
    
      # section.each do |hash|
      #   hash[:section] = section
      # end

    # hash = Hash[*section]
    
    # puts hash.inspect

   
    # p sections[:section]
    # section << sections
    # p "ALL sections:#{sections}"
    # p "#{sections[:section]}"
    # puts "Resource: #{resource}"
    # p "#{section[1]}"
    # p "#{section[2]}"
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

