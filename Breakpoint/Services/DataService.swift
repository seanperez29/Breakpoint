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
    
    func getUsername(forUID uid: String, completionHandler: @escaping (_ username: String) -> Void) {
        Constants.URLs.Users.observeSingleEvent(of: .value) { userSnapshot in
            let user = userSnapshot.childSnapshot(forPath: uid)
            let email = user.childSnapshot(forPath: "email").value as! String
            completionHandler(email)
        }
    }
    
    func getEmail(forSearchQuery query: String, completionHandler: @escaping (_ emailArray: [String]) -> Void) {
        var emailArray = [String]()
        Constants.URLs.Users.observe(.value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            completionHandler(emailArray)
        }
    }
    
    func getIDs(forUsernames usernames: [String], completionHandler: @escaping (_ uidArray: [String]) -> Void) {
        Constants.URLs.Users.observeSingleEvent(of: .value) { userSnapshot in
            var idArray = [String]()
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if usernames.contains(user.childSnapshot(forPath: "email").value as! String) {
                    idArray.append(user.key)
                }
            }
            completionHandler(idArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description: String, forUserIds ids: [String], completionHandler: @escaping (_ groupCreated: Bool) -> Void) {
        Constants.URLs.Groups.childByAutoId().updateChildValues(["title": title, "description": description, "members": ids])
        completionHandler(true)
    }
    
    func getAllGroups(completionHandler: @escaping (_ groupsArray: [Group]) -> Void) {
        var groupsArray = [Group]()
        Constants.URLs.Groups.observeSingleEvent(of: .value) { groupSnapshot in
            guard let groupSnapshot = groupSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for group in groupSnapshot {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    let group = Group(title: title, groupDescription: description, key: group.key, members: memberArray)
                    groupsArray.append(group)
                }
            }
            completionHandler(groupsArray)
        }
    }
}
