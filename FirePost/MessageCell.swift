//
//  MessageCell.swift
//  FirePost
//
//  Created by Mehmet Koca on 25/07/2017.
//  Copyright © 2017 on3. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak  var msgTextLabel: UILabel!
    
    var msg: Message!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(msg: Message) {
        self.msg = msg
        self.msgTextLabel.text = msg.msgText
    }
    
}
