//
//  HomeController.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class MainController: NSObject, MainNavigationInterface {
    lazy var factories:FactoryFactory = {
        return FactoryFactory(main:self)
    }()
    
    lazy var window:UIWindow = {
        let window = self.factories.ui.createWindow()
        window.rootViewController = self.navigation
        return window
    }()
    
    lazy var navigation:UINavigationController = {
        return self.factories.ui.createNavigation(UIViewController())
    }()
    
    lazy var shapes:ShapesController = {
        return self.factories.controllers.shapes()
    }()
    
    func start() {
        shapes.list()
    }
    
    func setViewControllers(viewControllers: [UIViewController], animated: Bool) {
        navigation.setViewControllers(viewControllers, animated: animated)
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigation.pushViewController(viewController, animated: animated)
    }
}
