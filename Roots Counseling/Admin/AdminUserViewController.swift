//
//  AdminUserViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/30/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore

class AdminUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = cell.textLabel?.font.withSize(22)
        return cell
    }
    
    var index = 0
    var user = ""
    var username = ""
    var arr = [String]()
    var newArr = [String]()

    @IBOutlet weak var AdminTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
//        navigationItem.rightBarButtonItem = editButtonItem
        let db = Firestore.firestore()
//        let uid: String = Auth.auth().currentUser!.uid
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if document.get("admin") as! Int == 0 && document.get("roots") as! Int == 1 {
                        self.arr.append(document.get("name") as! String)
                        self.newArr.append(document.documentID)
                    }
                }
                
                self.updateList()
            }
        }
    }
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        // Takes care of toggling the button's title.
//        super.setEditing(editing, animated: true)
//
//        // Toggle table view editing.
//        AdminTableView.setEditing(editing, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.user = self.newArr[self.index]
        self.username = self.arr[self.index]
        performSegue(withIdentifier: "seg1", sender: self)
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        let ref = Database.database().reference()
//        ref.child("roots").child(arr[indexPath.row]).removeValue()
//
//        arr.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
    
    func updateList(){
        AdminTableView.dataSource = self
        AdminTableView.delegate = self
        AdminTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! SelectReportViewController
        dest.user = user
        dest.username = username
    }
    
    @IBAction func unwindUser(_ sender: UIStoryboardSegue){}
}
