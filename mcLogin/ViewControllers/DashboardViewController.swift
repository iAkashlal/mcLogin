//
//  ViewController.swift
//  mcLogin
//
//  Created by Akashlal on 10/11/19.
//  Copyright © 2019 Akashlal. All rights reserved.
//

import UIKit
import WebKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlStr:String = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: urlStr)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }


}

