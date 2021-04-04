//
//  AdminWeekViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/31/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class AdminWeekViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = cell.textLabel?.font.withSize(22)
        return cell
    }
    
    var index = 0
    var user = ""
    var username = ""
    var week = ""
    var arr = [String]()

    @IBOutlet weak var AdminTableView: UITableView!
    
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
        let doc = db.collection("users").document(user)
        doc.getDocument { (document, error) in
            if let document = document, document.exists {
                let week = document.get("week") as! Int
                
                if week > 1 {
                    for i in 1...(week-1) {
                        self.arr.append("Week \(i)")
                    }
                }
                
                self.arr = self.arr.sorted() {$0.localizedStandardCompare($1) == .orderedDescending}
                self.updateList()
            }
        }
    }
    
    func updateList(){
        AdminTableView.dataSource = self
        AdminTableView.delegate = self
        AdminTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.week = self.arr[self.index]
        performSegue(withIdentifier: "seg2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! PageViewController
        dest.user = user
        dest.week = week
    }
}
