//
//  EditViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/10/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class EditViewController: UIViewController {
    var date = ""
    @IBOutlet weak var rate: UISegmentedControl!
    @IBOutlet weak var entryBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        date = df.string(from: Date())
        navigationItem.title = date
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if(text == "\n") {
//            entryBox.resignFirstResponder()
//            return false
//        }
//        return true
//    }
    
    @IBAction func save(_ sender: Any) {
        let emo = rate.selectedSegmentIndex + 1
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Journal").document(date).setData(["entry": entryBox.text!, "emotion": emo])
        
        performSegue(withIdentifier: "undo", sender: self)
    }
}
