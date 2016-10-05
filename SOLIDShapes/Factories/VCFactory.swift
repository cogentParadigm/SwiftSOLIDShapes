//
//  VCFactory.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class VCFactory: NSObject {
    let factories:FactoryFactory
    lazy var _shapesList:ShapesListViewController = {
       return ShapesListViewController(navigation:self.factories.main.shapes)
    }()
    init(factories:FactoryFactory) {
        self.factories = factories
    }
    func shapesList() -> ShapesListViewController {
        return _shapesList
    }
    func circleForm() -> CircleFormViewController {
        return CircleFormViewController(listener:shapesList())
    }
    func rectangleForm() -> RectangleFormViewController {
        return RectangleFormViewController(listener:shapesList())
    }
}
