class RestroController < UITableViewController
  include RestaurantData
  include RestroView

  def self.initPlain
    self.alloc.initWithStyle(UITableViewStylePlain)
  end

  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    myTableView = create_table_view
    view.addSubview(myTableView)
  end

end