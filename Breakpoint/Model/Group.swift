//
//  Group.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation

struct Group {
    
    private(set) var title: String
    private(set) var groupDescription: String
    private(set) var key: String
    private(set) var members: [String]
    private(set) var memberCount: Int
    
    init(title: String, groupDescription: String, key: String, members: [String]) {
        self.title = title
        self.groupDescription = groupDescription
        self.key = key
        self.memberCount = members.count
        self.members = members
    }
    
}
