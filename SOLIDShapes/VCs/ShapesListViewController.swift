//
//  ShapesListViewController.swift
//  SOLIDShapes
//
//  Created by Ali Gangji on 10/4/16.
//  Copyright © 2016 Neon Rain Interactive. All rights reserved.
//

import UIKit

class ShapesListViewController: UITableViewController, ShapeSavedListener {
    
    var shapes = [ShapeInterface]()
    let navigation:ShapesNavigationInterface
    let output:StringOutputInterface
    
    init(navigation:ShapesNavigationInterface, output:StringOutputInterface) {
        self.navigation = navigation
        self.output = output
        super.init(style: .Plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(createShape))
        
        let button = UIBarButtonItem(title: "Calculate Area", style: .Plain, target: self, action: #selector(calculateArea))
        setToolbarItems([button], animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: animated)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shapes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath)

        let shape = shapes[indexPath.row]
        cell.textLabel?.text = shape.description

        return cell
    }
    
    func createShape() {
        navigation.create()
    }
    
    func didCreateShape(shape: ShapeInterface) {
        shapes.append(shape)
        tableView.reloadData()
    }
    
    func calculateArea() {
        let calculator = ShapeAreaCalculator(shapes: shapes)
        output.output(calculator.description)
    }

}
