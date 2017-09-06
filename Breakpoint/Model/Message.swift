//
//  Message.swift
//  Breakpoint
//
//  Created by Sean Perez on 9/6/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation

struct Message {
    
    private(set) var message: String
    private(set) var senderId: String
    
    init(message: String, senderId: String) {
        self.message = message
        self.senderId = senderId
    }
}
