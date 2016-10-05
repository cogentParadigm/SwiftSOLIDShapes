//
//  UIFactory.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class UIFactory: NSObject {
    func createWindow() -> UIWindow {
        return UIWindow(frame: UIScreen.mainScreen().bounds)
    }
    func createNavigation(root:UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: root)
    }
    func createNavigation() -> UINavigationController {
        return createNavigation(UINavigationController())
    }
}
