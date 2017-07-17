//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Tommy Qiu on 7/11/17.
//  Copyright © 2017 Tommy Co. All rights reserved.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        // 1
        delegate = self
        // 2
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            // present photo taking action sheet
            print("take photo")
            photoHelper.presentActionSheet(from: self)
            return false
        } else {
            return true
        }
    }
}
