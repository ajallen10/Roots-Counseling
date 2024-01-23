//
//  PastCrisisViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/20/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
//import FirebaseDatabase
import CoreData
import FirebaseFirestore

class PastCrisisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crisisCell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = cell.textLabel?.font.withSize(22)
        return cell
    }
    
    var index = 0
    var user = ""
    var date = ""
    var isRoots = ""
    var arr = [String]()
    
    
    @IBOutlet weak var crisisTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        guard let userID = Auth.auth().currentUser?.displayName else { return }
        user = userID
        
        read()
    }
    
    func read(){
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).collection("Crisis").getDocuments() { (querySnapshot, err) in
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
       
       func updateList(){
           crisisTableView.dataSource = self
           crisisTableView.delegate = self
           crisisTableView.reloadData()
       }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.date = self.arr[self.index]
        performSegue(withIdentifier: "crisisSeg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "crisisSeg"{
            let dest = segue.destination as! UserCrisisViewController
            dest.date = date
        }
    }
}
