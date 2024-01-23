//
//  UserCrisisViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/20/21.
//  Copyright © 2021 Abby Allen. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore
import CoreData

class UserCrisisViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var pleaseBefore: UILabel!
    @IBOutlet weak var pleaseAfter: UILabel!
    @IBOutlet weak var pleaseUse: UILabel!
    @IBOutlet weak var tippBefore: UILabel!
    @IBOutlet weak var tippAfter: UILabel!
    @IBOutlet weak var tippUse: UILabel!
    @IBOutlet weak var breatheBefore: UILabel!
    @IBOutlet weak var breatheAfter: UILabel!
    @IBOutlet weak var breatheUse: UILabel!
    @IBOutlet weak var sootheBefore: UILabel!
    @IBOutlet weak var sootheAfter: UILabel!
    @IBOutlet weak var sootheUse: UILabel!
    @IBOutlet weak var improveBefore: UILabel!
    @IBOutlet weak var improveAfter: UILabel!
    @IBOutlet weak var improveUse: UILabel!
    @IBOutlet weak var acceptsBefore: UILabel!
    @IBOutlet weak var acceptsAfter: UILabel!
    @IBOutlet weak var acceptsUse: UILabel!
    @IBOutlet weak var stopBefore: UILabel!
    @IBOutlet weak var stopAfter: UILabel!
    @IBOutlet weak var stopUse: UILabel!
    @IBOutlet weak var prosBefore: UILabel!
    @IBOutlet weak var prosAfter: UILabel!
    @IBOutlet weak var prosUse: UILabel!
    @IBOutlet weak var factsBefore: UILabel!
    @IBOutlet weak var factsAfter: UILabel!
    @IBOutlet weak var factsUse: UILabel!
    @IBOutlet weak var oppB: UILabel!
    @IBOutlet weak var oppA: UILabel!
    @IBOutlet weak var oppU: UILabel!
    
    var user = ""
    var date = ""
    var isRoots = ""
    var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
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
        
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
        
        read()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return dataView
    }
    
    func read(){
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        
        let des = db.collection("users").document(uid).collection("Crisis").document(date).collection("please").document("Description")
            
        des.getDocument() { (document, error) in
            if let document = document, document.exists {
                self.descrip.text = document.get("data") as? String
            }
        }
        
        //please
        let pleaseEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("please").document("Emotion")
            
        pleaseEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.pleaseBefore.text = String(num)
                self.pleaseBefore.isHidden = false
            }
        }
        
        let pleaseAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("please").document("Emotion After")
            
        pleaseAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.pleaseAfter.text = String(num)
                self.pleaseAfter.isHidden = false
            }
        }
        
        let pleaseUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("please").document("Usefulness")
            
        pleaseUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.pleaseUse.text = String(num)
                self.pleaseUse.isHidden = false
            }
        }
        
        //stop
        let stopEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("stop").document("Emotion")
            
        stopEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.stopBefore.text = String(num)
                self.stopBefore.isHidden = false
            }
        }
        
        let stopAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("stop").document("Emotion After")
            
        stopAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.stopAfter.text = String(num)
                self.stopAfter.isHidden = false
            }
        }
        
        let stopUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("stop").document("Usefulness")
            
        stopUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.stopUse.text = String(num)
                self.stopUse.isHidden = false
            }
        }
        
        //pros
        let prosEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("pros").document("Emotion")
            
        prosEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.prosBefore.text = String(num)
                self.prosBefore.isHidden = false
            }
        }
        
        let prosAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("pros").document("Emotion After")
            
        prosAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.prosAfter.text = String(num)
                self.prosAfter.isHidden = false
            }
        }
        
        let prosUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("pros").document("Usefulness")
            
        prosUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.prosUse.text = String(num)
                self.prosUse.isHidden = false
            }
        }
        
        //facts
        let factsEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("facts").document("Emotion")
            
        factsEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.factsBefore.text = String(num)
                self.factsBefore.isHidden = false
            }
        }
        
        let factsAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("facts").document("Emotion After")
            
        factsAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.factsAfter.text = String(num)
                self.factsAfter.isHidden = false
            }
        }
        
        let factsUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("facts").document("Usefulness")
            
        factsUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.factsUse.text = String(num)
                self.factsUse.isHidden = false
            }
        }
        
        //tipp
        let tippEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("tipp").document("Emotion")
            
        tippEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.tippBefore.text = String(num)
                self.tippBefore.isHidden = false
            }
        }
        
        let tippAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("tipp").document("Emotion After")
            
        tippAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.tippAfter.text = String(num)
                self.tippAfter.isHidden = false
            }
        }
        
        let tippUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("tipp").document("Usefulness")
            
        tippUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.tippUse.text = String(num)
                self.tippUse.isHidden = false
            }
        }
        
        //breathe
        let breatheEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("breathe").document("Emotion")
            
        breatheEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.breatheBefore.text = String(num)
                self.breatheBefore.isHidden = false
            }
        }
        
        let breatheAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("breathe").document("Emotion After")
            
        breatheAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.breatheAfter.text = String(num)
                self.breatheAfter.isHidden = false
            }
        }
        
        let breatheUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("breathe").document("Usefulness")
            
        breatheUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.breatheUse.text = String(num)
                self.breatheUse.isHidden = false
            }
        }
        
        //soothe
        let sootheEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("soothe").document("Emotion")
            
        sootheEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.sootheBefore.text = String(num)
                self.sootheBefore.isHidden = false
            }
        }
        
        let sootheAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("soothe").document("Emotion After")
            
        sootheAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.sootheAfter.text = String(num)
                self.sootheAfter.isHidden = false
            }
        }
        
        let sootheUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("soothe").document("Usefulness")
            
        sootheUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.sootheUse.text = String(num)
                self.sootheUse.isHidden = false
            }
        }
        
        //improve
        let improveEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("improve").document("Emotion")
            
        improveEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.improveBefore.text = String(num)
                self.improveBefore.isHidden = false
            }
        }
        
        let improveAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("improve").document("Emotion After")
            
        improveAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.improveAfter.text = String(num)
                self.improveAfter.isHidden = false
            }
        }
        
        let improveUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("improve").document("Usefulness")
            
        improveUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.improveUse.text = String(num)
                self.improveUse.isHidden = false
            }
        }
        
        //accepts
        let acceptsEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("accepts").document("Emotion")
            
        acceptsEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.acceptsBefore.text = String(num)
                self.acceptsBefore.isHidden = false
            }
        }
        
        let acceptsAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("accepts").document("Emotion After")
            
        acceptsAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.acceptsAfter.text = String(num)
                self.acceptsAfter.isHidden = false
            }
        }
        
        let acceptsUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("accepts").document("Usefulness")
            
        acceptsUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.acceptsUse.text = String(num)
                self.acceptsUse.isHidden = false
            }
        }
        
        //opposite
        let oppositeEmo = db.collection("users").document(uid).collection("Crisis").document(date).collection("opposite").document("Emotion")
            
        oppositeEmo.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.oppB.text = String(num)
                self.oppB.isHidden = false
            }
        }
        
        let oppositeAfter = db.collection("users").document(uid).collection("Crisis").document(date).collection("opposite").document("Emotion After")
            
        oppositeAfter.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.oppA.text = String(num)
                self.oppA.isHidden = false
            }
        }
        
        let oppositeUse = db.collection("users").document(uid).collection("Crisis").document(date).collection("opposite").document("Usefulness")
            
        oppositeUse.getDocument() { (document, error) in
            if let document = document, document.exists {
                let num = document.get("data") as! Int
                self.oppU.text = String(num)
                self.oppU.isHidden = false
            }
        }

    }
}

