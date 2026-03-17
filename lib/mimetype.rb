class MimeType

  
  def self.for(filtyp)
      if filtyp == "png"
              content_type ="image/png"
      elsif filtyp == "jpg"
              content_type = "image/jpeg"
      #text
      elsif filtyp == "css"
              content_type = "text/css"
      elsif filtyp == "html"
              content_type = "text/html"
      elsif filtyp == "js"
              content_type = "text/javascript"
      end
      
    return content_type
        #return "Content-Type: #{content_type}"


  end



end