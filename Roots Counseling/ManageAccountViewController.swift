//
//  ManageAccountViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 10/1/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ManageAccountViewController: UIViewController {
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var change: UIButton!

        var username = ""
        var week = 0
        var roots = false
        var uid = Auth.auth().currentUser!.uid

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let db = Firestore.firestore()
            let doc = db.collection("users").document(uid)
            doc.getDocument { (document, error) in
                if let document = document, document.exists {
                    if(document.get("week") as? Int != nil){
                        self.week = document.get("week") as! Int
                    }
                    else {
                        let str = document.get("week") as! String
                        self.week = Int(str)!
                    }
                    
                    if(document.get("roots") as? Bool != nil){
                        self.roots = document.get("roots") as! Bool
                    }
                    else{
                        let str = document.get("roots") as! String
                        self.roots = Bool(str) ?? false
                    }
                    
                    if self.roots {
                        self.type.text = "You are currently a Roots client"
                    }
                    else {
                        self.type.text = "You are currently NOT a Roots client"
                    }
                }
            }
            
            change.layer.cornerRadius = 3.0
            change.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            change.layer.shadowOpacity = 0.3
            change.layer.shadowRadius = 1.0
        }

        @IBAction func changeType(_ sender: Any) {
            let db = Firestore.firestore()
            if roots {
                db.collection("users").document(uid).setData(["name": username, "roots": false, "admin": false, "week": week])
                roots = false
                type.text = "You are currently NOT a Roots client"
            }
            else {
                db.collection("users").document(uid).setData(["name": username, "roots": true, "admin": false, "week": week])
                roots = true
                type.text = "You are currently a Roots client"
            }
        }
}
