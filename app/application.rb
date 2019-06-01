class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last
      an_item = Item.all.find{|i| i.name == item_name}

      if @@items.include? an_item
        resp.write an_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404

    end
 
    resp.finish
  end
end