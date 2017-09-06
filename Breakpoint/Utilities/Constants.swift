//
//  Constants.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/5/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation
import Firebase

struct Constants {
    
    struct URLs {
        static let FirebaseDatabase = Database.database().reference()
        static let Users = Constants.URLs.FirebaseDatabase.child("users")
        static let Groups = Constants.URLs.FirebaseDatabase.child("groups")
        static let Feed = Constants.URLs.FirebaseDatabase.child("feed")
    }
    
    struct Cells {
        static let FeedCell = "FeedCell"
        static let UserCell = "UserCell"
        static let GroupCell = "GroupCell"
    }
}
