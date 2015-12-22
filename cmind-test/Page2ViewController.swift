//
//  Page2ViewController.swift
//  cmind-test
//
//  Created by Marat S. on 21/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import UIKit

private let basicCellId = "basicCell"

class Page2ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  private let groupingFormatter = GroupingFormatter()

  private lazy var data: [String] = {
    return self.fillDataSource()
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
  }

  private func fillDataSource() -> [String] {
    return (0...100).forEach {
      return self.groupingFormatter.grouping(
        self.groupingFormatter.random(0, 99999_99999_99999_99999)
      )
    }
  }

}

extension Page2ViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(basicCellId)

    cell.textLabel?.text = data[indexPath.row]

    return cell
  }

}

extension Page2ViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    if indexPath.row == 0 {
      dismissViewControllerAnimated(true, completion: nil)
    }
  }

}
