//
//  DataService.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let instance = DataService()
    
    func createUser(_ uid: String, _ userData: [String: Any]) {
        Constants.URLs.Users.child(uid).updateChildValues(userData)
    }
}
