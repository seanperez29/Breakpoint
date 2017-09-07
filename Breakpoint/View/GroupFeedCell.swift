//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

    func configureCell(profileImage: UIImage, username: String, message: String) {
        self.profileImage.image = profileImage
        self.usernameLabel.text = username
        self.messageLabel.text = message
    }
}
