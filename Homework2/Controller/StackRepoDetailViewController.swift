//
//  StackRepoDetailsViewController.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import UIKit
import WebKit

class StackRepoDetailViewController: UIViewController {
    var repository: Question?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
 
        webView = WKWebView(frame: self.view.bounds)
               webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
               webView.translatesAutoresizingMaskIntoConstraints = false
               self.view.addSubview(webView)
        
    }
        private func setupWebView() {
            view.addSubview(webView)
            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: view.topAnchor),
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
            
        }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let repository,
           let url = URL(string: repository.link) {
            webView.load(URLRequest(url: url))
        }
    }
    deinit {
        webView = nil
    }
}
