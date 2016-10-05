//
//  AlertBuilder.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class AlertBuilder: NSObject {
    
    let controller:UIAlertController
    var completion:(()->Void)?
    
    init(title:String, message:String, preferredStyle:UIAlertControllerStyle) {
        controller = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        super.init()
    }
    
    convenience init(title:String, message:String, preferredStyle:UIAlertControllerStyle, handler:(()->Void)?) {
        self.init(title:title, message:message, preferredStyle: preferredStyle)
        setCompletionHandler(handler)
    }
    
    convenience init(title:String, message:String) {
        self.init(title:title, message:message, preferredStyle: .Alert)
    }
    
    convenience init(title:String, message:String, handler:(()->Void)?) {
        self.init(title:title, message:message)
        setCompletionHandler(handler)
    }
    
    func setCompletionHandler(handler:(()->Void)?) -> AlertBuilder {
        completion = handler
        return self
    }
    
    func addAction(title:String, style:UIAlertActionStyle, handler:(UIAlertAction)->Void) -> AlertBuilder {
        let action = UIAlertAction(title: title, style: style) { (alert:UIAlertAction!) in
            handler(alert)
            if (self.completion != nil) {
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.completion!()
                }
            }
        }
        controller.addAction(action)
        return self
    }
    
    func addAction(title:String, handler:(UIAlertAction)->Void) -> AlertBuilder {
        return addAction(title, style: .Default, handler: handler)
    }
    
    func show() -> AlertBuilder {
        if let target = UIApplication.sharedApplication().keyWindow?.rootViewController {
            
            
            if let view:UIView = UIApplication.sharedApplication().keyWindow?.subviews.last {
                
                controller.popoverPresentationController?.sourceView = view
                
                target.presentViewController(controller, animated: true, completion: nil)
            }
        }
        return self
    }
}

