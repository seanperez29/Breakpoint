//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text, email != "", let password = passwordTextField.text, password != "" else { return }
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, error) in
            if success {
                self.performSegue(withIdentifier: "unwindToFeed", sender: nil)
            } else {
                print(String(describing: error?.localizedDescription))
            }
            AuthService.instance.registerUser(withEmail: email, andPassword: password, completionHandler: { (success, error) in
                if success {
                    AuthService.instance.loginUser(withEmail: email, andPassword: password, completionHandler: { (success, error) in
                        if success {
                            self.performSegue(withIdentifier: "unwindToFeed", sender: nil)
                        } else {
                            print(String(describing: error?.localizedDescription))
                        }
                    })
                }
            })
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC: UITextFieldDelegate {}
