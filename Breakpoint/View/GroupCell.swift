//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var memberCount: UILabel!
    
    func configureCell(_ group: Group) {
        self.groupTitle.text = group.title
        self.groupDescription.text = group.groupDescription
        self.memberCount.text = "\(group.memberCount) members"
    }
}
