//
//  ViewController.swift
//  cmind-test
//
//  Created by Marat S. on 20/12/15.
//  Copyright © 2015 m4rr. All rights reserved.
//

import UIKit

class Page1ViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  @IBOutlet weak var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    if webView.request == nil {
      loadGoogle(intoWebView: webView)
    }
  }

  private func loadGoogle(intoWebView webView: UIWebView) {
    loadUrl("https://google.com", intoWebView: webView)
  }

  private func loadYahoo(intoWebView webView: UIWebView) {
    loadUrl("https://yahoo.com", intoWebView: webView)
  }

  private func loadUrl(urlString: String, intoWebView webView: UIWebView) {
    if let url = NSURL(string: urlString) {
      webView.loadRequest(NSURLRequest(URL: url))
    }
  }

}

extension Page1ViewController: UIWebViewDelegate {

  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    switch navigationType {
    case .LinkClicked:
      if request.URL?.host == "yahoo.com"
      return false
    }
  }

//  func webViewDidFinishLoad(webView: UIWebView) {
//    <#code#>
//  }

}
