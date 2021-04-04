//
//  UpdateViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/12/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UpdateViewController: UIViewController {
    var date = ""
    @IBOutlet weak var entryBox: UITextView!
    @IBOutlet weak var scale: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = date
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Journal").document(date).getDocument() { (document, error) in
            if let document = document, document.exists {
                let entry = document.get("entry") as! String
                let emotion = document.get("emotion") as! Int
                
                self.entryBox.text = entry
                self.scale.selectedSegmentIndex = emotion - 1
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            entryBox.resignFirstResponder()
            return false
        }
        return true
    }

    @IBAction func save(_ sender: Any) {
        let emo = scale.selectedSegmentIndex + 1
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Journal").document(date).setData(["entry": entryBox.text!, "emotion": emo])
        
        performSegue(withIdentifier: "undo", sender: self)
    }
}
