module RestroView
  def create_table_view
    myTableView = UITableView.alloc.initWithFrame(view.bounds, style: UITableViewStylePlain)
    myTableView.dataSource = self
    myTableView.delegate = self
    myTableView
  end

  def tableView(tableView, numberOfRowsInSection:section)
    data.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = get_table_cell(tableView)
    cell.textLabel.text = data[indexPath.row].name
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