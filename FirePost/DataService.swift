//
//  DataService.swift
//  FirePost
//
//  Created by Mehmet Koca on 25/07/2017.
//  Copyright © 2017 on3. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
    static let ds = DataService()
    
    var MSGS_DB_REF = DB_BASE.child("messages")
}
