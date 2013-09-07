class RestroController < UITableViewController
  include RestaurantData
  include RestroView

  def self.initPlain
    self.alloc.initWithStyle(UITableViewStylePlain)
  end

  def viewDidLoad
    super
    @restaurants = []
    search_bar = create_search_bar
    search_bar.text = 'Chicago'
    view.tableHeaderView = search_bar
    view.dataSource = view.delegate = self
    searchBarSearchButtonClicked(search_bar)
   end

end