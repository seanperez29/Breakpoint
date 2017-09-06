//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    func configureCell(profileImage: UIImage, message: Message) {
        self.profileImage.image = profileImage
        self.emailLabel.text = message.senderId
        self.messageLabel.text = message.message
    }
}
