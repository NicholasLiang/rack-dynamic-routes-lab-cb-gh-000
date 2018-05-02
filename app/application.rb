class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
      resp.write item.nil? ? "Item not found";resp.status = 404 : item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end