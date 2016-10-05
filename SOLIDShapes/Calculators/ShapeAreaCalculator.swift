//
//  ShapeAreaCalculator.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/5/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class ShapeAreaCalculator: NSObject {
    let shapes:[ShapeInterface]
    
    override var description: String {
        return "\(shapes.count) shapes with a total area of \(sum())"
    }
    
    init(shapes:[ShapeInterface]) {
        self.shapes = shapes
        super.init()
    }
    
    func sum() -> Double {
        var area: Double = 0
        for shape in shapes {
            area += shape.area()
        }
        return area
    }
    
}
