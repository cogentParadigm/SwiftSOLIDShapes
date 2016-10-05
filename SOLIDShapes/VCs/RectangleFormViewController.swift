//
//  RectangleFormViewController.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/5/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit
import Eureka

class RectangleFormViewController: FormViewController {

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
        
        form +++ Section("Rectangle")
            <<< StepperRow() {
                $0.title = "Width"
                $0.tag = "width"
            }
            <<< StepperRow() {
                $0.title = "Height"
                $0.tag = "height"
            }
    }
    
    func done() {
        if let wrow = form.rowByTag("width") as? StepperRow, hrow = form.rowByTag("height") as? StepperRow, width = wrow.value, height = hrow.value {
            let shape = Rectangle(width: width, height: height)
            delegate.didCreateShape(shape)
            navigationController?.popViewControllerAnimated(true)
        }
    }

}
