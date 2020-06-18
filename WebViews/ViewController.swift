//
//  ViewController.swift
//  WebViews
//
//  Created by Anderson Malaguitte on 18/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Finished!")
    }


    @IBAction func didPressButton(_ sender: UIButton) {
        if let urlObject = URL(string: "https://google.com") {
            
            //Opens safari
            UIApplication.shared.open(urlObject, options: [:], completionHandler: nil)
            
            //Opens safari view controller (within the current app)
//            let safariViewController = SFSafariViewController(url: urlObject)
//            safariViewController.delegate = self
//            present(safariViewController, animated: true, completion: nil)
        }
        
    }
}

