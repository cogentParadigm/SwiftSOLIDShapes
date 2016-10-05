//
//  MainNavigationInterface.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

protocol MainNavigationInterface {
    func setViewControllers(viewControllers:[UIViewController], animated:Bool)
    func pushViewController(viewController:UIViewController, animated:Bool)
}
