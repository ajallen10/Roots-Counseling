//
//  RateSkillViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/12/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseFirestore

class RateSkillViewController: UIViewController {
    @IBOutlet weak var rating: UISegmentedControl!
    @IBOutlet weak var emotion: UISegmentedControl!
    @IBOutlet weak var trySkill: UIButton!
    @IBOutlet weak var mainMenu: UIButton!
    @IBOutlet weak var done: UIButton!
    
    var emotionNum = 0
    var attempt = 0
    var ex = ""
    var please = false
    var tipp = false
    var improve = false
    var accepts = false
    var facts = false
    var stop = false
    var opposite = false
    var pros = false
    var breathe = false
    var soothe = false
    var coach = false
    var isRoots = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.string(from: Date())
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        let doc = db.collection("users").document(uid).collection("Crisis").document(date)
        
        doc.getDocument { (document, error) in
            if let document = document, document.exists {
                if document.get("attempt") as? Int != nil{
                    self.attempt = document.get("attempt") as! Int
                }
                
            } else {
                //do nothing, this is the users first submission for the day
            }
        }
        
        trySkill.layer.cornerRadius = 3.0
        trySkill.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        trySkill.layer.shadowOpacity = 0.3
        trySkill.layer.shadowRadius = 1.0
        
        mainMenu.layer.cornerRadius = 3.0
        mainMenu.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        mainMenu.layer.shadowOpacity = 0.3
        mainMenu.layer.shadowRadius = 1.0
        
        done.layer.cornerRadius = 3.0
        done.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        done.layer.shadowOpacity = 0.3
        done.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "View")
        request.returnsObjectsAsFaults = false
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "IsRoots")
        request2.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request2)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "roots") != nil {
                    isRoots = str.value(forKey: "roots") as! String
                }
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
        do{
            let result = try context.fetch(request)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "emotion") != nil && str.value(forKey: "emotion") as! Int != 0 {
                    emotionNum = str.value(forKey: "emotion") as! Int
                }
            }
        }catch{
            print(error)
        }
        
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request1.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request1)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "stop") != nil {
                    stop = str.value(forKey: "stop") as! Bool
                }
                if str.value(forKey: "pros") != nil {
                    pros = str.value(forKey: "pros") as! Bool
                }
                if str.value(forKey: "facts") != nil {
                    facts = str.value(forKey: "facts") as! Bool
                }
                if str.value(forKey: "please") != nil {
                    please = str.value(forKey: "please") as! Bool
                }
                if str.value(forKey: "tipp") != nil {
                    tipp = str.value(forKey: "tipp") as! Bool
                }
                if str.value(forKey: "breathe") != nil {
                    breathe = str.value(forKey: "breathe") as! Bool
                }
                if str.value(forKey: "soothe") != nil {
                    soothe = str.value(forKey: "soothe") as! Bool
                }
                if str.value(forKey: "improve") != nil {
                    improve = str.value(forKey: "improve") as! Bool
                }
                if str.value(forKey: "accepts") != nil {
                    accepts = str.value(forKey: "accepts") as! Bool
                }
                if str.value(forKey: "opposite") != nil {
                    opposite = str.value(forKey: "opposite") as! Bool
                }
                if str.value(forKey: "coach") != nil {
                    coach = str.value(forKey: "coach") as! Bool
                }
                if str.value(forKey: "explan") != nil {
                    ex = str.value(forKey: "explan") as! String
                }
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
        if emotionNum == 1 || emotionNum == 2 || emotionNum == 3 || emotionNum == 4 {
            if please {
                if facts {
                    if coach {
                        trySkill.isHidden = true
                        mainMenu.isHidden = true
                    }
                }
            }
        }
        else if emotionNum == 6 || emotionNum == 7 || emotionNum == 5 {
            if please {
                if stop {
                    if opposite{
                        if pros {
                            if coach {
                                trySkill.isHidden = true
                                mainMenu.isHidden = true
                            }
                        }
                    }
                }
            }
        }
        else if emotionNum == 8 || emotionNum == 9 || emotionNum == 10 {
            if please {
                if tipp {
                    if breathe {
                        if soothe {
                            if improve {
                                if accepts {
                                    if coach {
                                        trySkill.isHidden = true
                                        mainMenu.isHidden = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @IBAction func next(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity1 = NSEntityDescription.entity(forEntityName: "View", in: context)
        let saveThis1 = NSManagedObject(entity: entity1!, insertInto: context)
        saveThis1.setValue("rate", forKey: "val")
        saveThis1.setValue(emotion.selectedSegmentIndex + 1, forKey: "emotion")
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.string(from: Date())
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            let db = Firestore.firestore()
            let uid: String = Auth.auth().currentUser!.uid
            
            
            if result.count > 0 {
                if attempt > 0 {
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").setData(["create":true])
                    
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Usefulness").setData(["data": rating.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion After").setData(["data": emotion.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion").setData(["data": emotionNum])
                    if ex != "" {
                        db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Description").setData(["data": ex])
                    }
                    
                }
                else {
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").setData(["create":true])
                    
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Usefulness").setData(["data": rating.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion After").setData(["data": emotion.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion").setData(["data": emotionNum])
                    if ex != "" {
                        db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Description").setData(["data": ex])
                    }
                }
            }
            
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
        if let result = try? context.fetch(request){
            for str in result as! [NSManagedObject]{
                if str.value(forKey: "skill") == nil {
                    context.delete(str)
                }
            }
        }
        
        do{
            try context.save()
            
        }catch{
            print("failed \(error)")
        }
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "sug")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func done(_ sender: Any) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let date = df.string(from: Date())
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request.returnsObjectsAsFaults = false
        
        let entity = NSEntityDescription.entity(forEntityName: "View", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        saveThis.setValue(emotion.selectedSegmentIndex + 1, forKey: "emotion")
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
        
        if let result = try? context.fetch(request){
            for str in result as! [NSManagedObject]{
                if str.value(forKey: "skill") == nil {
                    context.delete(str)
                }
            }
        }
        
        do{
            try context.save()
            
        }catch{
            print("failed \(error)")
        }
        
        do{
            let result = try context.fetch(request)
            let db = Firestore.firestore()
            let uid: String = Auth.auth().currentUser!.uid
            
            if result.count > 0 {
                if attempt > 0 {
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").setData(["create":true])
                    
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Usefulness").setData(["data": rating.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion After").setData(["data": emotion.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion").setData(["data": emotionNum])
                    if ex != "" {
                        db.collection("users").document(uid).collection("Crisis").document("\(date) (\(attempt))").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Description").setData(["data": ex])
                    }
                    
                }
                else {
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").setData(["create":true])
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Usefulness").setData(["data": rating.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion After").setData(["data": emotion.selectedSegmentIndex + 1])
                    db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Emotion").setData(["data": emotionNum])
                    if ex != "" {
                        db.collection("users").document(uid).collection("Crisis").document("\(date)").collection((result[result.count - 1] as AnyObject).value(forKey: "skill") as! String).document("Description").setData(["data": ex])
                    }
                }
                
                attempt += 1
                db.collection("users").document(uid).collection("Crisis").document("\(date)").setData(["attempt": attempt])
            }
            
        }catch{
            print("Couldn't access Core Data \(error)")
        }
            
        if let result = try? context.fetch(request){
            for str in result as! [NSManagedObject]{
                context.delete(str)
            }
        }
        
        do{
            try context.save()
            
        }catch{
            print("failed \(error)")
        }
        
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "View")
        request1.returnsObjectsAsFaults = false
        
        if let result = try? context.fetch(request1){
            for str in result as! [NSManagedObject]{
                context.delete(str)
            }
        }
            
        do{
            try context.save()
            
        }catch{
            print("failed \(error)")
        }
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func home(_ sender: Any) {
        let context1 = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity1 = NSEntityDescription.entity(forEntityName: "View", in: context1)
        let saveThis1 = NSManagedObject(entity: entity1!, insertInto: context1)
        saveThis1.setValue("rate", forKey: "val")
        
        do{
            try context1.save()
        }catch{
            print("Save failed: \(error)")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
}
