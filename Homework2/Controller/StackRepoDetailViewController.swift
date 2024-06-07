//
//  StackRepoDetailsViewController.swift
//  Homework2
//
//  Created by user on 2024/05/30.
//

import UIKit
import WebKit

class StackRepoDetailViewController: UIViewController {
    var question: Question?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
 
      
        
    }
        private func setupWebView() {
            webView = WKWebView(frame: self.view.bounds)
                   webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                   webView.translatesAutoresizingMaskIntoConstraints = false
                   self.view.addSubview(webView)
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
        if let question = question,
           let url = URL(string: question.link) {
            webView.load(URLRequest(url: url))
        } else {
            print("Error: Question or URL is nil")

        }
    }
}
