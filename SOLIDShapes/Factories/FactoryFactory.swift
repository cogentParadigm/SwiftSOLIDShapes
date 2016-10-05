//
//  FactoryFactory.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import Foundation

class FactoryFactory: NSObject {
    let main:MainController
    init(main:MainController) {
        self.main = main
    }
    
    lazy var controllers:ControllerFactory = {
        return ControllerFactory(factories:self)
    }()
    lazy var ui:UIFactory = {
        return UIFactory()
    }()
    lazy var vcs:VCFactory = {
        return VCFactory(factories:self)
    }()
    
}
