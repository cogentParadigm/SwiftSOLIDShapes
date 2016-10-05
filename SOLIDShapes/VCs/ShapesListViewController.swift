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
    
    init(navigation:ShapesNavigationInterface) {
        self.navigation = navigation
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

}
