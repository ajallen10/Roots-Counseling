//
//  ThirdViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/15/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//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

import UIKit
import FirebaseDatabase
import FirebaseAuth
import CoreData
import FirebaseFirestore

class ThirdViewController: UIViewController {
    var day = 0
    var user = ""
    var weekCounter = 1
    var isRoots = ""
    
    @IBOutlet weak var week: UILabel!
    @IBOutlet weak var mon: UIButton!
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thu: UIButton!
    @IBOutlet weak var fri: UIButton!
    @IBOutlet weak var sat: UIButton!
    @IBOutlet weak var sun: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        guard let userID = Auth.auth().currentUser?.displayName else { return }
        user = userID
        isRoots = ""
        
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
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        let doc = db.collection("users").document(uid)
        
        doc.getDocument { (document, error) in
            if let document = document, document.exists {
                let doc = document.get("week")
                self.weekCounter = doc as! Int
                self.week.text = "Week \(self.weekCounter)"
                
            } else {
                print("Document does not exist")
            }
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Done")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            var sum = 0
            for str in result as![NSManagedObject]{
                if str.value(forKey: "monDone") != nil && str.value(forKey: "monDone") as! Bool{
                    mon.isEnabled = false
                    mon.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "tueDone") != nil && str.value(forKey: "tueDone") as! Bool{
                    tue.isEnabled = false
                    tue.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "wedDone") != nil && str.value(forKey: "wedDone") as! Bool{
                    wed.isEnabled = false
                    wed.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "thuDone") != nil && str.value(forKey: "thuDone") as! Bool{
                    thu.isEnabled = false
                    thu.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "friDone") != nil && str.value(forKey: "friDone") as! Bool{
                    fri.isEnabled = false
                    fri.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "satDone") != nil && str.value(forKey: "satDone") as! Bool{
                    sat.isEnabled = false
                    sat.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
                if str.value(forKey: "sunDone") != nil && str.value(forKey: "sunDone") as! Bool{
                    sun.isEnabled = false
                    sun.setTitleColor(UIColor.white, for: UIControl.State.normal)
                    submit.isEnabled = true
                    sum += 1
                }
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        for num in 1...7{
//            let t1 = Date().timeIntervalSince1970
            write("Week \(weekCounter)", "Day \(num)", num)
//            let t2 = Date().timeIntervalSince1970
//            
//            print("Day \(num): \(t2 - t1)")
        }
        
        mon.isEnabled = true
        mon.setTitleColor(UIColor.black, for: UIControl.State.normal)
        tue.isEnabled = true
        tue.setTitleColor(UIColor.black, for: UIControl.State.normal)
        wed.isEnabled = true
        wed.setTitleColor(UIColor.black, for: UIControl.State.normal)
        thu.isEnabled = true
        thu.setTitleColor(UIColor.black, for: UIControl.State.normal)
        fri.isEnabled = true
        fri.setTitleColor(UIColor.black, for: UIControl.State.normal)
        sat.isEnabled = true
        sat.setTitleColor(UIColor.black, for: UIControl.State.normal)
        sun.isEnabled = true
        sun.setTitleColor(UIColor.black, for: UIControl.State.normal)
        submit.isEnabled = false
        
        weekCounter += 1
        week.text = "Week \(weekCounter)"
        
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        db.collection("users").document(uid).updateData(["week": weekCounter])
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        for num in 1...7{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Day\(num)")
            request.returnsObjectsAsFaults = false
            
            do{
                let result = try context.fetch(request)
                for str in result as![NSManagedObject]{
                    context.delete(str)
                }
            }catch{
                print("Couldn't access Core Data \(error)")
            }
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Done")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for str in result as![NSManagedObject]{
                context.delete(str)
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ReportViewController
        dest.day = day
    }
    
    func write(_ week:String,_ day:String,_ num:Int){
        let db = Firestore.firestore()
        let uid: String = Auth.auth().currentUser!.uid
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Day\(num)")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for str in result as![NSManagedObject]{
                if (str.value(forKey: "alcoholAction") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("alcoholAction").setData(["data": str.value(forKey: "alcoholAction")!])
                }
                if (str.value(forKey: "alcoholUrge") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("alcoholUrge").setData(["data": str.value(forKey: "alcoholUrge")!])
                }
                if (str.value(forKey: "anger") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("anger").setData(["data": str.value(forKey: "anger")!])
                }
                if (str.value(forKey: "anxious") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("anxious").setData(["data": str.value(forKey: "anxious")!])
                }
                if (str.value(forKey: "awake") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("awake").setData(["data": str.value(forKey: "awake")!])
                }
                if (str.value(forKey: "bedtime") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("bedtime").setData(["data": str.value(forKey: "bedtime")!])
                }
                if (str.value(forKey: "date") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("date").setData(["data": str.value(forKey: "date")!])
                }
                if (str.value(forKey: "drugsAction") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("drugsAction").setData(["data": str.value(forKey: "drugsAction")!])
                }
                if (str.value(forKey: "drugsUrge") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("drugsUrge").setData(["data": str.value(forKey: "drugsUrge")!])
                }
                if (str.value(forKey: "fear") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("fear").setData(["data": str.value(forKey: "fear")!])
                }
                if (str.value(forKey: "happy") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("happy").setData(["data": str.value(forKey: "happy")!])
                }
                if (str.value(forKey: "meds") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("meds").setData(["data": str.value(forKey: "meds")!])
                }
                if (str.value(forKey: "misery") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("misery").setData(["data": str.value(forKey: "misery")!])
                }
                if (str.value(forKey: "missClass") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("missClass").setData(["data": str.value(forKey: "missClass")!])
                }
                if (str.value(forKey: "otherAction") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("otherAction").setData(["data": str.value(forKey: "otherAction")!])
                }
                if (str.value(forKey: "otherRank") != nil) && (str.value(forKey: "other") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("otherRank").setData(["data": str.value(forKey: "otherRank")!])
                }
                if (str.value(forKey: "other") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("other").setData(["data": str.value(forKey: "other")!])
                }
                if (str.value(forKey: "sad") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("sad").setData(["data": str.value(forKey: "sad")!])
                }
                if (str.value(forKey: "selfHarmAction") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("selfHarmAction").setData(["data": str.value(forKey: "selfHarmAction")!])
                }
                if (str.value(forKey: "selfHarmUrge") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("selfHarmUrge").setData(["data": str.value(forKey: "selfHarmUrge")!])
                }
                if (str.value(forKey: "sex") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("sex").setData(["data": str.value(forKey: "sex")!])
                }
                if (str.value(forKey: "shame") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("shame").setData(["data": str.value(forKey: "shame")!])
                }
                if (str.value(forKey: "skill1") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill1").setData(["data": str.value(forKey: "skill1")!])
                }
                if (str.value(forKey: "skill2") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill2").setData(["data": str.value(forKey: "skill2")!])
                }
                if (str.value(forKey: "skill3") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill3").setData(["data": str.value(forKey: "skill3")!])
                }
                if (str.value(forKey: "skill4") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill4").setData(["data": str.value(forKey: "skill4")!])
                }
                if (str.value(forKey: "skill5") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill5").setData(["data": str.value(forKey: "skill5")!])
                }
                if (str.value(forKey: "skill6") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill6").setData(["data": str.value(forKey: "skill6")!])
                }
                if (str.value(forKey: "skill7") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill7").setData(["data": str.value(forKey: "skill7")!])
                }
                if (str.value(forKey: "skill8") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill8").setData(["data": str.value(forKey: "skill8")!])
                }
                if (str.value(forKey: "skill9") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill9").setData(["data": str.value(forKey: "skill9")!])
                }
                if (str.value(forKey: "skill10") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill10").setData(["data": str.value(forKey: "skill10")!])
                }
                if (str.value(forKey: "skill11") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill11").setData(["data": str.value(forKey: "skill11")!])
                }
                if (str.value(forKey: "skill12") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill12").setData(["data": str.value(forKey: "skill12")!])
                }
                if (str.value(forKey: "skill13") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill13").setData(["data": str.value(forKey: "skill13")!])
                }
                if (str.value(forKey: "skill14") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill14").setData(["data": str.value(forKey: "skill14")!])
                }
                if (str.value(forKey: "skill15") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill15").setData(["data": str.value(forKey: "skill15")!])
                }
                if (str.value(forKey: "skill16") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill16").setData(["data": str.value(forKey: "skill16")!])
                }
                if (str.value(forKey: "skill17") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill17").setData(["data": str.value(forKey: "skill17")!])
                }
                if (str.value(forKey: "skill18") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill18").setData(["data": str.value(forKey: "skill18")!])
                }
                if (str.value(forKey: "skill19") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill19").setData(["data": str.value(forKey: "skill19")!])
                }
                if (str.value(forKey: "skill20") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill20").setData(["data": str.value(forKey: "skill20")!])
                }
                if (str.value(forKey: "skill21") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill21").setData(["data": str.value(forKey: "skill21")!])
                }
                if (str.value(forKey: "skill22") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill22").setData(["data": str.value(forKey: "skill22")!])
                }
                if (str.value(forKey: "skill23") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill23").setData(["data": str.value(forKey: "skill23")!])
                }
                if (str.value(forKey: "skill24") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill24").setData(["data": str.value(forKey: "skill24")!])
                }
                if (str.value(forKey: "skill25") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill25").setData(["data": str.value(forKey: "skill25")!])
                }
                if (str.value(forKey: "skill26") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill26").setData(["data": str.value(forKey: "skill26")!])
                }
                if (str.value(forKey: "skill27") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill27").setData(["data": str.value(forKey: "skill27")!])
                }
                if (str.value(forKey: "skill28") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill28").setData(["data": str.value(forKey: "skill28")!])
                }
                if (str.value(forKey: "skill29") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill29").setData(["data": str.value(forKey: "skill29")!])
                }
                if (str.value(forKey: "skill30") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill30").setData(["data": str.value(forKey: "skill30")!])
                }
                if (str.value(forKey: "skill31") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skill31").setData(["data": str.value(forKey: "skill31")!])
                }
                if (str.value(forKey: "skills") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("skills").setData(["data": str.value(forKey: "skills")!])
                }
                if (str.value(forKey: "suicidalAction") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("suicidalAction").setData(["data": str.value(forKey: "suicidalAction")!])
                }
                if (str.value(forKey: "suicidalUrge") != nil) {
                    db.collection("users").document(uid).collection("Weeks").document(week).collection(day).document("suicidalUrge").setData(["data": str.value(forKey: "suicidalUrge")!])
                }
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
    }
    
    @IBAction func day1(_ sender: Any) {
        day = 1
    }
    @IBAction func day2(_ sender: Any) {
        day = 2
    }
    @IBAction func day3(_ sender: Any) {
        day = 3
    }
    @IBAction func day4(_ sender: Any) {
        day = 4
    }
    @IBAction func day5(_ sender: Any) {
        day = 5
    }
    @IBAction func day6(_ sender: Any) {
        day = 6
    }
    @IBAction func day7(_ sender: Any) {
        day = 7
    }
    
    @IBAction func unwindCancel(_ sender: UIStoryboardSegue){}
    
    @IBAction func unwind(_ sender: UIStoryboardSegue){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Done", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)

        switch day {
            case 1:
                mon.isEnabled = false
                mon.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "monDone")
            case 2:
                tue.isEnabled = false
                tue.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "tueDone")
            case 3:
                wed.isEnabled = false
                wed.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "wedDone")
            case 4:
                thu.isEnabled = false
                thu.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "thuDone")
            case 5:
                fri.isEnabled = false
                fri.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "friDone")
            case 6:
                sat.isEnabled = false
                sat.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "satDone")
            case 7:
                sun.isEnabled = false
                sun.setTitleColor(UIColor.white, for: UIControl.State.normal)
                submit.isEnabled = true
                saveThis.setValue(true, forKey: "sunDone")
            default:
                print("Day wasn't defined")
        }
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
    }
}
