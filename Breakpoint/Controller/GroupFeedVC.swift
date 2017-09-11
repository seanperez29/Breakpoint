//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    var group: Group!
    var groupMessages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageContentView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initData()
    }
    
    func initData() {
        groupTitleLabel.text = group.title
        DataService.instance.getEmailsFor(group: group) { emails in
            self.membersLabel.text = emails.joined(separator: ", ")
        }
        Constants.URLs.Groups.observe(.value) { _ in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group) { groupMessages in
                self.groupMessages = groupMessages
                self.tableView.reloadData()
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .bottom, animated: false)
                }
            }
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        guard let message = messageTextField.text, message != "" else { return }
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        DataService.instance.uploadPost(withMessage: message, forUID: Auth.auth().currentUser!.uid, withGroupKey: group.key) { success in
            if success {
                self.messageTextField.text = ""
                self.messageTextField.isEnabled = true
                self.sendButton.isEnabled = true
            }
        }
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.GroupFeedCell, for: indexPath) as! GroupFeedCell
        let groupMessage = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: groupMessage.senderId) { email in
            cell.configureCell(profileImage: #imageLiteral(resourceName: "defaultProfileImage"), username: email, message: groupMessage.message)
        }
        return cell
    }
}
