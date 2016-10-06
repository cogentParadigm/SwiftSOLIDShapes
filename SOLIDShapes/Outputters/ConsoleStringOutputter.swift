//
//  ConsoleStringOutputter.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/5/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class ConsoleStringOutputter: NSObject, StringOutputInterface {
    func output(data:String) {
        print(data)
    }
}
