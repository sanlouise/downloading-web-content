//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Sandra Adams-Hallie on Feb/28/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Integrate web content
        
        
        // 1. Define web address
        // By default, NSURL produces 'optional'  get rid of this with '!'
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // 2. Like opening a browser in the app, not in view.. Three variables will be returned.
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            
            // Will happen when task completes 
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

