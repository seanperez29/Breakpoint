//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    var group: Group!
    
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
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
