module RestaurantData
  def data(city)
    json = retrieve_data(city)
    create_restaurants json
  end

  def retrieve_data(city)
    encoded_city = city.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = "http://restro.nalwaya.com/restaurants/search.json?city=#{encoded_city}"
    json = nil
    begin
      json = JSONParser.parse_from_url url
    rescue RuntimeError => e
      presentError e.message
    end
    json
  end

  def create_restaurants(json)
    restaurants = []
    json.each do |restaurant|
      restaurants << Restaurant.new(restaurant)
    end
    restaurants
  end

  def presentError(error_msg)
    alert = UIAlertView.new
    alert.message = error_msg
    alert.show
  end
end