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

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */

}

extension Page2ViewController: UITableViewDataSource {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(basicCellId)

    cell.textLabel?.text = "\(indexPath.row)"

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
