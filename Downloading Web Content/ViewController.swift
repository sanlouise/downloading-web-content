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
        // By default, NSURL produces 'optional'  get rid of this with '!'. Needs to be https unless defined as safe in Info.plist file (NSApp file and NSAllows file)!
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // 2. Like opening a browser in the app, not in view.. Three variables will be returned.
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            
            // Will happen when task completes .
            // 3. Only runs when data is detected.. so only proper links and when user has internet. Won't crash.
            
            if let urlContent = data {
                
                // 4. Decode web content
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                print(webContent)
                
            } else {
                
                print("Something went wrong.")
                
            }
            
            
        }
        
        // 5. Run the task
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

