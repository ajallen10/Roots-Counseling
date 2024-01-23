//
//  JournalViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/10/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class JournalViewController: UIViewController {
    var date = ""
    @IBOutlet weak var emotion: UILabel!
    @IBOutlet weak var entryBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = date
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Journal").document(date).getDocument() { (document, error) in
            if let document = document, document.exists {
                let entry = document.get("entry") as! String
                
                if(document.get("emotion") as? String != nil){
                    self.emotion.text = document.get("emotion") as? String
                }
                
                self.entryBox.text = entry
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let dest = segue.destination as! UpdateViewController
            dest.date = date
        }
    }
    
    @IBAction func unwindEdit(_ sender: UIStoryboardSegue){}
}
