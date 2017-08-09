//
//  ViewController.swift
//  FirePost
//
//  Created by Mehmet Koca on 25/07/2017.
//  Copyright © 2017 on3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var msgField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var msgs = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.MSGS_DB_REF.queryOrdered(byChild: "postedDate").observe(.value, with: { (snapshot) in
            self.msgs = []
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if let postDict = snap.value as? [String: AnyObject] {
                        let message = Message(msgId: snap.key, msgData: postDict)
                        //self.msgs.append(message)
                        self.msgs.insert(message, at: 0)
                    }
                }
            }
            self.tableView.reloadData()
        
        })
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = msgs[indexPath.row] //msgs.reversed()[indexPath.row] | ters çevirme alternatif.
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell {
            cell.configureCell(msg: msg)
            return cell
        } else {
            return MessageCell()
        }
    }
    
    @IBAction func sendPostBtn(_ sender: AnyObject) {
        if let msgText = msgField.text , !msgText.isEmpty {
            let msg = [
                "text": msgText,
                "postedDate": ServerValue.timestamp()
            ] as [String : Any]
            let fireMSg = DataService.ds.MSGS_DB_REF.childByAutoId()
            fireMSg.setValue(msg)
            
            
            msgField.text = ""
            tableView.reloadData()
        }
    }
    

    
}

