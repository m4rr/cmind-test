//
//  ParentViewController.swift
//  cmind-test
//
//  Created by Marat S. on 23/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

  lazy var viewControllers: [UIViewController] = [
    Page1ViewController(),
    Page2ViewController(),
  ]

  lazy var pageViewController: UIPageViewController? = {
    let pvc = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
    pvc?.dataSource = self

    return pvc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    if let pageViewController = pageViewController {
      addChildViewController(pageViewController)
      view.addSubview(pageViewController.view)
      pageViewController.didMoveToParentViewController(self)
    }
  }

  override func updateViewConstraints() {

    
    super.updateViewConstraints()
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

extension ParentViewController: UIPageViewControllerDataSource {

  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
//    viewControllers.indexOf(viewController) == 1
    return viewController is Page2ViewController ? Page1ViewController() : nil
  }

  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    return viewController is Page1ViewController ? Page2ViewController() : nil
  }


}
