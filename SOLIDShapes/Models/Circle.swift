//
//  Circle.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import Foundation

class Circle: ShapeInterface {
    let radius:Double
    var description:String {
        return "Circle (\(radius))"
    }
    init(radius:Double) {
        self.radius = radius
    }
    func area() -> Double {
        return M_PI * pow(radius, 2)
    }
}
