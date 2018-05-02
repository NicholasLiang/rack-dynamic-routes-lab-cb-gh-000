class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
      resp.write item.nil? ? "Item not found" : item.price
    else
      status 404
      resp.write "Route not found"
      
    end
    
    resp.finish
  end
end