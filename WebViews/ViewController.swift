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

class ViewController: UIViewController, SFSafariViewControllerDelegate, UITextFieldDelegate {
    let WEBSITE_ADDRESS = "https://google.com"

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.delegate = self
        if let urlObject = URL(string: WEBSITE_ADDRESS) {
            webView.load(URLRequest(url: urlObject))
        }
    }
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //get the text if there's any, otherwise empty string
        let address = textField.text ?? "";
        //Fixing the url quickly if needed
        let adressFormatted = self.getUrlWithHttps(url: address)
        if let urlObject = URL(string: adressFormatted) {
            webView.load(URLRequest(url: urlObject))
        }
        textField.resignFirstResponder() //hides keyboard
        return false
    }
    
    func getUrlWithHttps(url: String) -> String {
        return url.contains("https://") ? url : "https://\(url)"
    }
    
    @IBAction func didPressBackButton(_ sender: UIButton) {
        webView.goBack()
    }
    
    /*
       @IBAction func didPressButton(_ sender: UIButton) {
           //Opens safari
           self.openSafariApp(url: WEBSITE_ADDRESS)
               
           //Opens safari view controller (within the current app)
           //self.openSafariControllerView(url: WEBSITE_ADDRESS)
       }
    */
    
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
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
          print("Finished!")
      }

}

