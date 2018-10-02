//
//  TableViewController.swift
//  vuzers-ios-sample
//
//  Created by patrick on 07/06/2018.
//  Copyright © 2018 Vuzers. All rights reserved.
//

import UIKit
import VuzersSDK

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let transportItems = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Manage Vuzers Forms
        if let vuzersHeaderView = VuzersManager.shared.getVuzersTableViewHeader(width: view.frame.width) {
            tableView.tableHeaderView = vuzersHeaderView
        }        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (transportItems.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = transportItems[indexPath.row]
        let imageName = UIImage(named: transportItems[indexPath.row])
        cell.imageView?.image = imageName
        
        return cell
    }
}
