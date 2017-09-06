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
    
    func configureCell(title: String, groupDescription: String, memberCount: Int) {
        self.groupTitle.text = title
        self.groupDescription.text = groupDescription
        self.memberCount.text = "\(memberCount) members."
    }
}
