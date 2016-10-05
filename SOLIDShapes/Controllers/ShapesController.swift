//
//  ShapesController.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class ShapesController: NSObject, ShapesNavigationInterface {
    let nav:MainNavigationInterface
    let vcs:VCFactory
    init(nav:MainNavigationInterface, vcs:VCFactory) {
        self.nav = nav
        self.vcs = vcs
    }
    func list() {
        let vc = vcs.shapesList()
        nav.setViewControllers([vc], animated: true)
    }
    func create() {
        AlertBuilder(title: "Create a new shape", message: "Circle or Rectangle?", preferredStyle: .ActionSheet)
        .addAction("Circle") { _ in
            let vc = self.vcs.circleForm()
            self.nav.pushViewController(vc, animated: true)
        }
        .addAction("Rectangle") { _ in
            let vc = self.vcs.rectangleForm()
            self.nav.pushViewController(vc, animated: true)
        }
        .addAction("Cancel", style:.Cancel) { _ in
            
        }.show()
    }
}
