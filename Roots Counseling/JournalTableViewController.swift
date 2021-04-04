//
//  JournalTableViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/10/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class JournalTableViewController: UITableViewController {
    var arr = [String]()
    var index = 0
    var date = ""
    
    @IBOutlet var journalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Journal").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.arr.append(document.documentID)
                }
                
                self.arr = self.arr.sorted() {$0.localizedStandardCompare($1) == .orderedDescending}
                self.updateList()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = cell.textLabel?.font.withSize(22)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.date = self.arr[self.index]
        performSegue(withIdentifier: "view", sender: self)
    }
    
    func updateList(){
        journalTableView.dataSource = self
        journalTableView.delegate = self
        journalTableView.reloadData()
    }

    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "view"{
            let dest = segue.destination as! JournalViewController
            dest.date = date
        }
    }
    
    @IBAction func unwindJournal(_ sender: UIStoryboardSegue){}
}
