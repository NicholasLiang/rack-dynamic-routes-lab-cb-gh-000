class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      
      item_price = req.path.split("/items/").last
      price = @@
      
    end
    
    resp.finish
  end
end