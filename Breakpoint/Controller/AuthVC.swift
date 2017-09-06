//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func facebookSignInButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: Any) {
        
    }
}
