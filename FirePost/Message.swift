//
//  Message.swift
//  FirePost
//
//  Created by Mehmet Koca on 25/07/2017.
//  Copyright © 2017 on3. All rights reserved.
//

import Foundation


class Message {
    var msgId: String!
    var msgText: String!
    var postedDate: String!
    
    init(msgId: String, msgData: [String: AnyObject]) {
        self.msgId = msgId
        
        if let msgText = msgData["text"] as? String {
            self.msgText = msgText
        }
        
        if let postedDate = msgData["postedDate"] as? String {
            self.postedDate = postedDate
        }
    }
}
