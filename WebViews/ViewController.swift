//
//  ViewController.swift
//  WebViews
//
//  Created by Anderson Malaguitte on 18/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    let WEBSITE_ADDRESS = "https://google.com"

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let urlObject = URL(string: WEBSITE_ADDRESS) {
            webView.load(URLRequest(url: urlObject))
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Finished!")
    }


    @IBAction func didPressButton(_ sender: UIButton) {
        //Opens safari
        self.openSafariApp(url: WEBSITE_ADDRESS)
            
        //Opens safari view controller (within the current app)
        //self.openSafariControllerView(url: WEBSITE_ADDRESS)
    }
    
    func openSafariApp(url: String) {
        if let urlObject = URL(string: url) {
            UIApplication.shared.open(urlObject, options: [:], completionHandler: nil)
        }
    }
    
    func openSafariControllerView(url: String) {
        if let urlObject = URL(string: url) {
            let safariViewController = SFSafariViewController(url: urlObject)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
        }
    }
}

