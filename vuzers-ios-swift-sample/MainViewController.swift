//
//  MainViewController.swift
//  vuzers-ios-sample
//
//  Created by patrick on 07/06/2018.
//  Copyright © 2018 Vuzers. All rights reserved.
//

import UIKit
import VuzersSDK

class MainViewController: UIViewController, VuzersManagerDelegate {

    private var sv:UIView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        VuzersManager.shared.delegate = self

        sv = UIViewController.displaySpinner(onView: self.view)
        VuzersManager.shared.load(collapseView: true)
        
        addNavBarImage()
    }
    
    func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "logo")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
    func didLoadForms() {
        print ("VuzersForms have been loaded....")
        UIViewController.removeSpinner(spinner: sv!)
    }
}

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
