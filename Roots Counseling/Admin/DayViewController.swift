//
//  DayViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 11/26/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import FirebaseFirestore

class DayViewController: UIViewController {
    var week = ""
    var user = ""
    var dayNum = ""
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var SHU: UILabel!
    @IBOutlet weak var SHA: UIButton!
    @IBOutlet weak var SU: UILabel!
    @IBOutlet weak var SA: UIButton!
    @IBOutlet weak var AU: UILabel!
    @IBOutlet weak var AA: UIButton!
    @IBOutlet weak var DU: UILabel!
    @IBOutlet weak var DA: UIButton!
    @IBOutlet weak var Other: UILabel!
    @IBOutlet weak var OU: UILabel!
    @IBOutlet weak var OA: UIButton!
    @IBOutlet weak var Meds: UIButton!
    @IBOutlet weak var Sex: UIButton!
    @IBOutlet weak var SkipClass: UIButton!
    @IBOutlet weak var BedTime: UILabel!
    @IBOutlet weak var WokeUp: UILabel!
    @IBOutlet weak var Anger: UILabel!
    @IBOutlet weak var Sad: UILabel!
    @IBOutlet weak var Happy: UILabel!
    @IBOutlet weak var Anxious: UILabel!
    @IBOutlet weak var Fear: UILabel!
    @IBOutlet weak var Shame: UILabel!
    @IBOutlet weak var Misery: UILabel!
    @IBOutlet weak var Skills: UILabel!
    @IBOutlet weak var S1: UIButton!
    @IBOutlet weak var S2: UIButton!
    @IBOutlet weak var S3: UIButton!
    @IBOutlet weak var S4: UIButton!
    @IBOutlet weak var S5: UIButton!
    @IBOutlet weak var S6: UIButton!
    @IBOutlet weak var S7: UIButton!
    @IBOutlet weak var S8: UIButton!
    @IBOutlet weak var S9: UIButton!
    @IBOutlet weak var S10: UIButton!
    @IBOutlet weak var S11: UIButton!
    @IBOutlet weak var S12: UIButton!
    @IBOutlet weak var S13: UIButton!
    @IBOutlet weak var S14: UIButton!
    @IBOutlet weak var S15: UIButton!
    @IBOutlet weak var S16: UIButton!
    @IBOutlet weak var S17: UIButton!
    @IBOutlet weak var S18: UIButton!
    @IBOutlet weak var S19: UIButton!
    @IBOutlet weak var S20: UIButton!
    @IBOutlet weak var S21: UIButton!
    @IBOutlet weak var S22: UIButton!
    @IBOutlet weak var S23: UIButton!
    @IBOutlet weak var S24: UIButton!
    @IBOutlet weak var S25: UIButton!
    @IBOutlet weak var S26: UIButton!
    @IBOutlet weak var S27: UIButton!
    @IBOutlet weak var S28: UIButton!
    @IBOutlet weak var S29: UIButton!
    @IBOutlet weak var S30: UIButton!
    @IBOutlet weak var S31: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
        
        if day.text == "Monday"{
            dayNum = "Day 1"
        }
        else if day.text == "Tuesday"{
            dayNum = "Day 2"
        }
        else if day.text == "Wednesday"{
            dayNum = "Day 3"
        }
        else if day.text == "Thursday"{
            dayNum = "Day 4"
        }
        else if day.text == "Friday"{
            dayNum = "Day 5"
        }
        else if day.text == "Saturday"{
            dayNum = "Day 6"
        }
        else if day.text == "Sunday"{
            dayNum = "Day 7"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.read()
        })
    }

    func read(){
        let db = Firestore.firestore()
        db.collection("users").document(user).collection("Weeks").document(week).collection(dayNum).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            else if querySnapshot!.count == 0 {
                self.date.text = "Not completed"
            }
            else {
                for document in querySnapshot!.documents {
                    if document.documentID == "alcoholAction" {
                        if (document.get("data") as! Int) == 0{
                            self.AA.isHidden = false
                        }
                    }
                    else if document.documentID == "date"{
                        self.date.text = document.get("data") as? String
                    }
                    else if document.documentID == "alcoholUrge"{
                        self.AU.isHidden = false
                        let num = document.get("data") as! Int
                        self.AU.text = String(num)
                    }
                    else if document.documentID == "anger"{
                        self.Anger.isHidden = false
                        let num = document.get("data") as! Int
                        self.Anger.text = String(num)
                    }
                    else if document.documentID == "anxious"{
                        self.Anxious.isHidden = false
                        let num = document.get("data") as! Int
                        self.Anxious.text = String(num)
                    }
                    else if document.documentID == "awake"{
                        self.WokeUp.isHidden = false
                        self.WokeUp.text = document.get("data") as? String
                    }
                    else if document.documentID == "bedtime"{
                        self.BedTime.isHidden = false
                        self.BedTime.text = document.get("data") as? String
                    }
                    else if document.documentID == "drugsAction"{
                        if (document.get("data") as! Int) == 0{
                            self.DA.isHidden = false
                        }
                    }
                    else if document.documentID == "drugsUrge"{
                        self.DU.isHidden = false
                        let num = document.get("data") as! Int
                        self.DU.text = String(num)
                    }
                    else if document.documentID == "fear"{
                        self.Fear.isHidden = false
                        let num = document.get("data") as! Int
                        self.Fear.text = String(num)
                    }
                    else if document.documentID == "happy"{
                        self.Happy.isHidden = false
                        let num = document.get("data") as! Int
                        self.Happy.text = String(num)
                    }
                    else if document.documentID == "meds"{
                        if (document.get("data") as! Int) == 0{
                            self.Meds.isHidden = false
                        }
                    }
                    else if document.documentID == "misery"{
                        self.Misery.isHidden = false
                        let num = document.get("data") as! Int
                        self.Misery.text = String(num)
                    }
                    else if document.documentID == "missClass"{
                        if (document.get("data") as! Int) == 0{
                            self.SkipClass.isHidden = false
                        }
                    }
                    else if document.documentID == "other"{
                        self.Other.text = document.get("data") as? String
                        self.Other.isHidden = false
                        
                    }
                    else if document.documentID == "otherAction"{
                        if (document.get("data") as! Int) == 0{
                            self.OA.isHidden = false
                        }
                    }
                    else if document.documentID == "otherRank"{
                        self.OU.isHidden = false
                        let num = document.get("data") as! Int
                        self.OU.text = String(num)
                    }
                    else if document.documentID == "sad"{
                        self.Sad.isHidden = false
                        let num = document.get("data") as! Int
                        self.Sad.text = String(num)
                    }
                    else if document.documentID == "selfHarmAction"{
                        if (document.get("data") as! Int) == 0{
                            self.SHA.isHidden = false
                        }
                    }
                    else if document.documentID == "selfHarmUrge"{
                        self.SHU.isHidden = false
                        let num = document.get("data") as! Int
                        self.SHU.text = String(num)
                    }
                    else if document.documentID == "sex"{
                        if (document.get("data") as! Int) == 0{
                            self.Sex.isHidden = false
                        }
                    }
                    else if document.documentID == "shame"{
                        self.Shame.isHidden = false
                        let num = document.get("data") as! Int
                        self.Shame.text = String(num)
                    }
                    else if document.documentID == "skill1"{
                        if (document.get("data") as! Int) == 0{
                            self.S1.isHidden = false
                        }
                    }
                    else if document.documentID == "skill2"{
                        if (document.get("data") as! Int) == 0{
                            self.S2.isHidden = false
                        }
                    }
                    else if document.documentID == "skill3"{
                        if (document.get("data") as! Int) == 0{
                            self.S3.isHidden = false
                        }
                    }
                    else if document.documentID == "skill4"{
                        if (document.get("data") as! Int) == 0{
                            self.S4.isHidden = false
                        }
                    }
                    else if document.documentID == "skill5"{
                        if (document.get("data") as! Int) == 0{
                            self.S5.isHidden = false
                        }
                    }
                    else if document.documentID == "skill6"{
                        if (document.get("data") as! Int) == 0{
                            self.S6.isHidden = false
                        }
                    }
                    else if document.documentID == "skill7"{
                        if (document.get("data") as! Int) == 0{
                            self.S7.isHidden = false
                        }
                    }
                    else if document.documentID == "skill8"{
                        if (document.get("data") as! Int) == 0{
                            self.S8.isHidden = false
                        }
                    }
                    else if document.documentID == "skill9"{
                        if (document.get("data") as! Int) == 0{
                            self.S9.isHidden = false
                        }
                    }
                    else if document.documentID == "skill10"{
                        if (document.get("data") as! Int) == 0{
                            self.S10.isHidden = false
                        }
                    }
                    else if document.documentID == "skill11"{
                        if (document.get("data") as! Int) == 0{
                            self.S11.isHidden = false
                        }
                    }
                    else if document.documentID == "skill12"{
                        if (document.get("data") as! Int) == 0{
                            self.S12.isHidden = false
                        }
                    }
                    else if document.documentID == "skill13"{
                        if (document.get("data") as! Int) == 0{
                            self.S13.isHidden = false
                        }
                    }
                    else if document.documentID == "skill14"{
                        if (document.get("data") as! Int) == 0{
                            self.S14.isHidden = false
                        }
                    }
                    else if document.documentID == "skill15"{
                        if (document.get("data") as! Int) == 0{
                            self.S15.isHidden = false
                        }
                    }
                    else if document.documentID == "skill16"{
                        if (document.get("data") as! Int) == 0{
                            self.S16.isHidden = false
                        }
                    }
                    else if document.documentID == "skill17"{
                        if (document.get("data") as! Int) == 0{
                            self.S17.isHidden = false
                        }
                    }
                    else if document.documentID == "skill18"{
                        if (document.get("data") as! Int) == 0{
                            self.S18.isHidden = false
                        }
                    }
                    else if document.documentID == "skill19"{
                        if (document.get("data") as! Int) == 0{
                            self.S19.isHidden = false
                        }
                    }
                    else if document.documentID == "skill20"{
                        if (document.get("data") as! Int) == 0{
                            self.S20.isHidden = false
                        }
                    }
                    else if document.documentID == "skill21"{
                        if (document.get("data") as! Int) == 0{
                            self.S21.isHidden = false
                        }
                    }
                    else if document.documentID == "skill22"{
                        if (document.get("data") as! Int) == 0{
                            self.S22.isHidden = false
                        }
                    }
                    else if document.documentID == "skill23"{
                        if (document.get("data") as! Int) == 0{
                            self.S23.isHidden = false
                        }
                    }
                    else if document.documentID == "skill24"{
                        if (document.get("data") as! Int) == 0{
                            self.S24.isHidden = false
                        }
                    }
                    else if document.documentID == "skill25"{
                        if (document.get("data") as! Int) == 0{
                            self.S25.isHidden = false
                        }
                    }
                    else if document.documentID == "skill26"{
                        if (document.get("data") as! Int) == 0{
                            self.S26.isHidden = false
                        }
                    }
                    else if document.documentID == "skill27"{
                        if (document.get("data") as! Int) == 0{
                            self.S27.isHidden = false
                        }
                    }
                    else if document.documentID == "skill28"{
                        if (document.get("data") as! Int) == 0{
                            self.S28.isHidden = false
                        }
                    }
                    else if document.documentID == "skill29"{
                        if (document.get("data") as! Int) == 0{
                            self.S29.isHidden = false
                        }
                    }
                    else if document.documentID == "skill30"{
                        if (document.get("data") as! Int) == 0{
                            self.S30.isHidden = false
                        }
                    }
                    else if document.documentID == "skill31"{
                        if (document.get("data") as! Int) == 0{
                            self.S31.isHidden = false
                        }
                    }
                    else if document.documentID == "skills"{
                        self.Skills.isHidden = false
                        let num = document.get("data") as! String
                        self.Skills.text = num
                    }
                    else if document.documentID == "phone"{
                        self.phone.isHidden = false
                        let num = document.get("data") as! String
                        self.phone.text = num
                    }
                    else if document.documentID == "suicidalAction"{
                        if (document.get("data") as! Int) == 0{
                            self.SA.isHidden = false
                        }
                    }
                    else if document.documentID == "suicidalUrge"{
                        self.SU.isHidden = false
                        let num = document.get("data") as! Int
                        self.SU.text = String(num)
                    }
                }
            }
        }
    }
}
