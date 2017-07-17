//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Tommy Qiu on 7/10/17.
//  Copyright © 2017 Tommy Co. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class CreateUsernameViewController:
UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6;
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
//        UserService.create(firUser, username: username) { (user) in
//            guard let user = user else {
//                // handle error
//                return
//            }
//            
//            User.setCurrent(user)
//            
//            let storyboard = UIStoryboard(name: "Main", bundle: .main)
//            if let initialViewController = storyboard.instantiateInitialViewController() {
//                self.view.window?.rootViewController = initialViewController
//                self.view.window?.makeKeyAndVisible()
//            }
//        }
        
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }

}
