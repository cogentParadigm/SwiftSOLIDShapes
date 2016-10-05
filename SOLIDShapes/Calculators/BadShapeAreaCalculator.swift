//
//  BadShapeAreaCalculator.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/5/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class BadShapeAreaCalculator: NSObject {
    let shapes:[AnyObject]
    init(shapes:[AnyObject]) {
        self.shapes = shapes
        super.init()
    }
    
    func sum() -> Double {
        var area:Double = 0
        for shape in shapes {
            if let circle = shape as? Circle {
                area += M_PI * pow(circle.radius, 2)
            } else if let rect = shape as? Rectangle {
                area += rect.width * rect.height
            }
        }
        return area
    }
    
    func output() {
        print("\(shapes.count) shapes with a total area of \(sum())")
    }
}
