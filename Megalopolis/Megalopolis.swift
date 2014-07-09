//
//  Megalopolis.swift
//  MegalopolisKit
//
//  Created by o_ame on 2014/07/09.
//
//

import Foundation

class HTTP {
    typealias Response = (AnyObject!, NSError!) -> Void
    
    class func get(url:String, done: Response) {
        let URL = NSURL(string: url)
        let req = NSURLRequest(URL: URL)
        
        let completion = { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let res = response as NSHTTPURLResponse!
            var error: NSError?
            var json: AnyObject!
            if (data) {
                json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error)
            }
            done(json, error)
        }
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue(), completionHandler: completion)
    }
}

class Megalopolis {
    typealias Data = AnyObject!
    typealias Response = (Data!, NSError!) -> Void
    
    class func getIndexes(index: Int, done: Response) -> Void {
        let completion = { (data: AnyObject!, error: NSError!) -> Void in
            done(data, error)
        }
        HTTP.get("http://coolier.sytes.net:8080/sosowa/ssw_l/\(index).json", done: completion)
    }
}
