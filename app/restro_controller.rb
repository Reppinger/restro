class RestroController < UITableViewController
  def viewDidLoad
    super
    @restaurant1 = Restaurant.new({'name' => 'Pizza madness', 'thumb_url_image' => nil,
                                  'food_type' => 'italian', 'desc' => 'Pizza at your door step in 30 min'})
    @restaurant2 = Restaurant.new({'name' => 'Lavasa', 'thumb_url_image' => nil, 'food_type' => 'italian', 'desc' => 'best Coffee house in town'})
    @restaurants = [@restaurant1, @restaurant2]
    view.backgroundColor = UIColor.whiteColor
    @myTableView = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStylePlain)
    @myTableView.dataSource = self
    @myTableView.delegate = self
    view.addSubview(@myTableView)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @restaurants.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) ||
        begin
            UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
        end
    cell.textLabel.text = @restaurants[indexPath.row].name
    cell
  end
end