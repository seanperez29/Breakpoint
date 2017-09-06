//
//  UserCell.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLabel.text = email
        if isSelected {
            checkImage.isHidden = false
        } else {
            checkImage.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if checkImage.isHidden == true {
                checkImage.isHidden = false
            } else {
                checkImage.isHidden = true
            }
        }
    }
    
}
