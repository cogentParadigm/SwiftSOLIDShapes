//
//  ShapesFormViewController.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit
import Eureka

class CircleFormViewController: FormViewController {
    
    let delegate:ShapeSavedListener
    
    init(listener:ShapeSavedListener) {
        delegate = listener
        super.init(style:.Plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(done))

        form +++ Section("Circle")
            <<< StepperRow() {
                $0.title = "Radius"
                $0.tag = "radius"
            }
    }
    
    func done() {
        if let row = form.rowByTag("radius") as? StepperRow, radius = row.value {
            let circle = Circle(radius: radius)
            delegate.didCreateShape(circle)
            navigationController?.popViewControllerAnimated(true)
        }
    }

}
