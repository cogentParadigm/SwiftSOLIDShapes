//
//  ControllerFactory.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class ControllerFactory: NSObject {
    let factories:FactoryFactory
    init(factories:FactoryFactory) {
        self.factories = factories
    }
    func main() -> MainController {
        return factories.main
    }
    func shapes() -> ShapesController {
        return ShapesController(nav: factories.main, vcs: factories.vcs)
    }
}
