class JSONParser
  def self.parse_from_url(url)
    data = DataParser.parse(url)
    error_ptr = Pointer.new(:object)
    json = NSJSONSerialization.JSONObjectWithData(data, options: 0, error: error_ptr)
    unless json
      alert = UIAlertView.new
      alert.message = error_ptr[0]
      alert.show
    end
    json
  end
end