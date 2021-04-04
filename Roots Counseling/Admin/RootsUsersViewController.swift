//
//  RootsUsersViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 2/4/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class RootsUsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if document.get("roots") as! Int == 1 && document.documentID != uid {
                        self.arr.append(document.get("name") as! String)
                        self.newArr.append(document.documentID)
                    }
                }
                
                self.updateList()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.user = self.newArr[self.index]
        self.username = self.arr[self.index]
        performSegue(withIdentifier: "add", sender: self)
    }
    
    func updateList(){
        AdminTableView.dataSource = self
        AdminTableView.delegate = self
        AdminTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add"{
            let dest = segue.destination as! AddAdminViewController
            dest.user = user
            dest.username = username
        }
    }
    
    @IBAction func unwindAdmin(_ sender: UIStoryboardSegue){}

}
