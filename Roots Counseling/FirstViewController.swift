//
//  FirstViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/14/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import CoreData
import FirebaseFirestore

class FirstViewController: UIViewController {
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var mind: UIButton!
    @IBOutlet weak var er: UIButton!
    @IBOutlet weak var ie: UIButton!
    @IBOutlet weak var dt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        let name = Auth.auth().currentUser?.displayName
        welcome.text = "Welcome \(name ?? "")"
        
        mind.layer.cornerRadius = 3.0
        mind.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        mind.layer.shadowOpacity = 0.3
        mind.layer.shadowRadius = 1.0
        
        er.layer.cornerRadius = 3.0
        er.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        er.layer.shadowOpacity = 0.3
        er.layer.shadowRadius = 1.0
        
        ie.layer.cornerRadius = 3.0
        ie.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        ie.layer.shadowOpacity = 0.3
        ie.layer.shadowRadius = 1.0
        
        dt.layer.cornerRadius = 3.0
        dt.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dt.layer.shadowOpacity = 0.3
        dt.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "IsRoots", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        let doc = db.collection("users").document(uid)
        
        doc.getDocument { (document, error) in
            if let document = document, document.exists {
                let doc = document.get("roots")
                if doc as! Int == 1 {
                    saveThis.setValue("roots", forKey: "roots")
                }
                else {
                    saveThis.setValue("notRoots", forKey: "roots")
                }
                
            } else {
                print("Document does not exist")
            }
        }
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
    }
    
    @IBAction func mind(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainTabBarController = storyboard.instantiateViewController(identifier: "m")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func emo(_ sender: Any) {
        
    }
    
    @IBAction func dist(_ sender: Any) {
        
    }
    
    @IBAction func inter(_ sender: Any) {
        
    }
    
//    @IBAction func unwindFirst(_ sender: UIStoryboardSegue){}
}

