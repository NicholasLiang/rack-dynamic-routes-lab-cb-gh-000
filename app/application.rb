class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
      
      resp.write item.price
      
    else
      resp.write "Item not found"
      resp.write "Route not found"
      status 400
    end
    
    resp.finish
  end
end