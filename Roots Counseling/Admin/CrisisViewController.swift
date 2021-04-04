//
//  CrisisViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/20/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class CrisisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
    var username = ""
    var date = ""
    var arr = [String]()
    
    @IBOutlet weak var crisisTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        if user != "" {
            navigationItem.title = username
            read()
        }
    }
    
    func read(){
        let db = Firestore.firestore()
//        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(user).collection("Crisis").getDocuments() { (querySnapshot, err) in
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
        let dest = segue.destination as! CrisisReportViewController
        dest.user = user
        dest.date = date
    }
}
