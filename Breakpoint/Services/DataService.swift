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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, completionHandler: @escaping (_ success: Bool) -> Void) {
        if groupKey != nil {
            // send to groups ref
        } else {
            // send to feed
            Constants.URLs.Feed.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            completionHandler(true)
        }
    }
    
    func getAllFeedMessages(completionHander: @escaping (_ messages: [Message]) -> Void) {
        Constants.URLs.Feed.observeSingleEvent(of: .value) { feedMessageSnapshot in
            var messageArray = [Message]()
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for feedMessage in feedMessageSnapshot {
                let message = feedMessage.childSnapshot(forPath: "content").value as! String
                let senderId = feedMessage.childSnapshot(forPath: "senderId").value as! String
                let newMessage = Message(message: message, senderId: senderId)
                messageArray.append(newMessage)
            }
            completionHander(messageArray)
        }
    }
}
