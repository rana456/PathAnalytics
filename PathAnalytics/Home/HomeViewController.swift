//
//  HomeViewController.swift
//  PathAnalytics
//
//  Created by Ramu Naidu Tumpala on 5/25/20.
//  Copyright © 2020 Ramu Naidu Tumpala. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class HomeViewController: UIViewController, HomeDisplaying {
    var presenter: HomePresenting!
    
    var webView: WKWebView!
    var progressHUD: MBProgressHUD?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        presenter.viewLoaded()
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.backgroundColor = UIColor.black
        view = webView
    }

    func setupUI() {
        progressHUD = MBProgressHUD.showAdded(to: webView, animated: true)
        progressHUD?.mode = MBProgressHUDMode.indeterminate
        progressHUD?.label.text = "Loading"
    }
    
    func reload() {
        let myRequest = URLRequest(url: presenter.url)
        webView.load(myRequest)
    }
    
    func showActivityIndicator() {
        progressHUD?.show(animated: true)
    }
    
    func hideActivityIndicator() {
        progressHUD?.hide(animated: true)

    }
    
}

extension HomeViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideActivityIndicator()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideActivityIndicator()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator()
    }
}
