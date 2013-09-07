class DataParser
  def self.parse(url)
    error_ptr = Pointer.new(:object)
    data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url), options: NSDataReadingUncached, error: error_ptr)
    unless data
      alert = UIAlertView.new
      alert.message = error_ptr[0]
      alert.show
    end
    data
  end
end