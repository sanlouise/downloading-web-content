//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Sandra Adams-Hallie on Feb/28/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//


/* NOTE : It is also possible to instead ONLY use, directly after 'let url' -----

webView.loadRequest(NSURLRequest(URL: url))

This results in a display of both HTML and CSS on the page.

The code below downloads the content to the app and can be manipulated.

*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Integrate web content
        
        
        // 1. Define web address
        // By default, NSURL produces 'optional'  get rid of this with '!'. Needs to be https unless defined as safe in Info.plist file (NSApp file and NSAllows file)!
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // 2. Like opening a browser in the app, not in view.. Three variables will be returned.
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            
            // Will happen when task completes.
            // 3. Only runs when data is detected.. so only proper links and when user has internet. Won't crash.
            
            if let urlContent = data {
                
                // 4. Decode web content
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                // 5. It may take a while for the queue to finish. Add this to ensure no synchronization problems occur.
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                
                // 6. Display actual content.
                
                self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                    
                })
             
        
            
            } else {
                
                // Print error message
                
            }
            
            
        }
        
        // 7. Run the task
        
        task.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




