//
//  AuthService.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, completionHandler: @escaping (_ status: Bool, _ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completionHandler(false, error)
                return
            }
            guard let userEmail = user.email else { return }
            let userData = ["provider": user.providerID, "email": userEmail]
            DataService.instance.createUser(user.uid, userData)
            completionHandler(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, completionHandler: @escaping (_ status: Bool, _ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                completionHandler(false, error)
                return
            }
            completionHandler(true, nil)
        }
    }
}
