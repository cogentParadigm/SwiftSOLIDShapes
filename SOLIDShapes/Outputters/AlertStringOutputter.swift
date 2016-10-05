//
//  AlertStringOutputter.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/5/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class AlertStringOutputter: NSObject, StringOutputInterface {
    func output(data:String) {
        AlertBuilder(title: "", message: data).addAction("OK") { _ in
                
        }.show()
    }
}
