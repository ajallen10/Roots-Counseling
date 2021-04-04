//
//  AddAdminViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/4/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AddAdminViewController: UIViewController {
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var type: UILabel!
    var user = ""
    var username = ""
    var week = 0
    var admin = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        let doc = db.collection("users").document(user)
        doc.getDocument { (document, error) in
            if let document = document, document.exists {
                self.week = document.get("week") as! Int
                self.admin = document.get("admin") as! Bool
                
                if self.admin {
                    self.type.text = "Therapist"
                }
                else {
                    self.type.text = "Client"
                }
            }
        }
        
        if user != "" {
            navigationItem.title = username
        }
        
        change.layer.cornerRadius = 3.0
        change.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        change.layer.shadowOpacity = 0.3
        change.layer.shadowRadius = 1.0
    }

    @IBAction func changeType(_ sender: Any) {
        let db = Firestore.firestore()
        if admin {
            db.collection("users").document(user).setData(["name": username, "roots": true, "admin": false, "week": week])
            admin = false
            type.text = "Client"
        }
        else {
            db.collection("users").document(user).setData(["name": username, "roots": true, "admin": true, "week": week])
            admin = true
            type.text = "Therapist"
        }
    }
}
