//
//  ViewController.swift
//  vuzers-ios-sample
//
//  Created by patrick on 06/06/2018.
//  Copyright © 2018 Vuzers. All rights reserved.
//

import UIKit
import VuzersSDK

class SimpleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orig = CGPoint(x: 0, y: 250)
        
        if let vuzersView = VuzersManager.shared.getVuzersView(origin: orig, width: view.frame.width) {
            self.view.addSubview(vuzersView)
        }
    }
}

