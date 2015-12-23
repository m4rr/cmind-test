//
//  ParentViewController.swift
//  cmind-test
//
//  Created by Marat S. on 23/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import UIKit
import PureLayout

class ParentViewController: UIViewController {

  @IBOutlet weak var splashView: UIView!

  enum PageType: String {
    case Page1 = "Page1ViewController"
    case Page2 = "Page2ViewController"
  }

  lazy var pageViewController: UIPageViewController? = {
    let pvc = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
    pvc?.dataSource = self

    return pvc
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    hideView(splashView, afterTimeInterval: 3)

    setupPageNavigation()
  }

  override func updateViewConstraints() {
    pageViewController?.view.autoPinEdgesToSuperviewEdges()
    
    super.updateViewConstraints()
  }

  private func hideView(hidingView: UIView, afterTimeInterval delayInSeconds: NSTimeInterval) {
    let queue = dispatch_get_main_queue()
    let floatNsec = Double(NSEC_PER_SEC)
    let delay = Int64(delayInSeconds * floatNsec)
    let popTime = dispatch_time(DISPATCH_TIME_NOW, delay);

    dispatch_after(popTime, queue) { () -> Void in
      UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseIn,
        animations: {
          hidingView.alpha = 0
        }, completion: { _ in
          hidingView.hidden = true
        }
      )
    }
  }

  private func setupPageNavigation() {
    guard let pageViewController = pageViewController,
      page1VC = movableViewController(type: .Page1),
      page2VC = movableViewController(type: .Page2) else {
        return;
    }

    page1VC.moveOpposite = {
      pageViewController.setViewControllers([page2VC], direction: .Forward, animated: true, completion: nil)
    }

    page2VC.moveOpposite = {
      pageViewController.setViewControllers([page1VC], direction: .Reverse, animated: true, completion: nil)
    }

    pageViewController.setViewControllers([page1VC], direction: .Forward, animated: false, completion: nil)

    addChildViewController(pageViewController)
    view.insertSubview(pageViewController.view, atIndex: 0)
    pageViewController.didMoveToParentViewController(self)
  }

  private func movableViewController(type type: PageType) -> MovableViewController? {
    return storyboard?.instantiateViewControllerWithIdentifier(type.rawValue) as? MovableViewController
  }

}

extension ParentViewController: UIPageViewControllerDataSource {

  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let vc: MovableViewController? = viewController is Page2ViewController ? movableViewController(type: .Page1) : nil
    vc?.moveOpposite = {
      pageViewController.setViewControllers([viewController], direction: .Forward, animated: true, completion: nil)
    }
    return vc
  }

  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let vc: MovableViewController? = viewController is Page1ViewController ? movableViewController(type: .Page2) : nil
    vc?.moveOpposite = {
      pageViewController.setViewControllers([viewController], direction: .Reverse, animated: true, completion: nil)
    }
    return vc
  }

}
