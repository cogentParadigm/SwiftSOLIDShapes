//
//  Rectangle.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import Foundation

class Rectangle: ShapeInterface {
    let width:Double
    let height:Double
    var description:String {
        return "Rectangle (\(width)x\(height))"
    }
    init(width:Double, height:Double) {
        self.width = width
        self.height = height
    }
    func area() -> Double {
        return width * height
    }
}
