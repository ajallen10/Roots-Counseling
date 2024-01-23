//
//  PastWeeklyViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/20/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//
//

import UIKit
//import FirebaseDatabase
import FirebaseAuth
import CoreData
import FirebaseFirestore

class PastWeeklyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
    var week = ""
    var isRoots = ""
    var arr = [String]()

    @IBOutlet weak var WTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        guard let userID = Auth.auth().currentUser?.displayName else { return }
        user = userID
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "IsRoots")
        request1.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request1)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "roots") != nil {
                    isRoots = str.value(forKey: "roots") as! String
                }
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
//        let t1 = Date().timeIntervalSince1970
        read()
//        let t2 = Date().timeIntervalSince1970
        
//        print("Read Time: \(t2 - t1)")
    }
    
    func read(){
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        let doc = db.collection("users").document(uid)
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
        WTableView.dataSource = self
        WTableView.delegate = self
        WTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.week = self.arr[self.index]
        performSegue(withIdentifier: "seg2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg2"{
            let dest = segue.destination as! UserPageViewController
            dest.user = user
            dest.week = week
        }
    }
}
