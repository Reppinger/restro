module RestroView

  def create_search_bar
    search_bar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    search_bar.delegate = self
    search_bar.showsCancelButton = true
    search_bar.sizeToFit
    search_bar
  end

  def searchBarSearchButtonClicked(search_bar)
    @restaurants = data(search_bar.text)
    view.reloadData
    search_bar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(search_bar)
    search_bar.resignFirstResponder
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @restaurants.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = get_table_cell(tableView)
    cell.textLabel.text = @restaurants[indexPath.row].name
    cell
  end

  def get_table_cell(tableView)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) ||
        begin
          UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
        end
    cell
  end

end