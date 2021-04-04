//
//  ReportViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/18/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData

class ReportViewController: UIViewController, UITextFieldDelegate {
    var isCancel = false;
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var todaysDate: UIDatePicker!
    
    @IBOutlet weak var selfHarmUrge: UISegmentedControl!
    @IBOutlet weak var selfHarmAction: UISegmentedControl!
    @IBOutlet weak var suicidalUrge: UISegmentedControl!
    @IBOutlet weak var suicidalAction: UISegmentedControl!
    @IBOutlet weak var alcoholUrge: UISegmentedControl!
    @IBOutlet weak var alcoholAction: UISegmentedControl!
    @IBOutlet weak var drugUrge: UISegmentedControl!
    @IBOutlet weak var drugAction: UISegmentedControl!
    @IBOutlet weak var otherTextField: UITextField!
    @IBOutlet weak var otherUrge: UISegmentedControl!
    @IBOutlet weak var otherAction: UISegmentedControl!
    @IBOutlet weak var medsAction: UISegmentedControl!
    @IBOutlet weak var sexAction: UISegmentedControl!
    @IBOutlet weak var cutClassAction: UISegmentedControl!
    
    @IBOutlet weak var wentToBed: UIDatePicker!
    @IBOutlet weak var wokeUp: UIDatePicker!
    
    @IBOutlet weak var emotionAnger: UISegmentedControl!
    @IBOutlet weak var emotionFear: UISegmentedControl!
    @IBOutlet weak var emotionHappy: UISegmentedControl!
    @IBOutlet weak var emotionSad: UISegmentedControl!
    @IBOutlet weak var emotionAnxious: UISegmentedControl!
    @IBOutlet weak var emotionShame: UISegmentedControl!
    @IBOutlet weak var emotionMisery: UISegmentedControl!
    
    @IBOutlet weak var skillsRange: UISegmentedControl!
    @IBOutlet weak var skill1Response: UISegmentedControl!
    @IBOutlet weak var skill2Response: UISegmentedControl!
    @IBOutlet weak var skill3Response: UISegmentedControl!
    @IBOutlet weak var skill4Response: UISegmentedControl!
    @IBOutlet weak var skill5Response: UISegmentedControl!
    @IBOutlet weak var skill6Response: UISegmentedControl!
    @IBOutlet weak var skill7Response: UISegmentedControl!
    @IBOutlet weak var skill8Response: UISegmentedControl!
    @IBOutlet weak var skill9Response: UISegmentedControl!
    @IBOutlet weak var skill10Response: UISegmentedControl!
    @IBOutlet weak var skill11Response: UISegmentedControl!
    @IBOutlet weak var skill12Response: UISegmentedControl!
    @IBOutlet weak var skill13Response: UISegmentedControl!
    @IBOutlet weak var skill14Response: UISegmentedControl!
    @IBOutlet weak var skill15Response: UISegmentedControl!
    @IBOutlet weak var skill16Response: UISegmentedControl!
    @IBOutlet weak var skill17Response: UISegmentedControl!
    @IBOutlet weak var skill18Response: UISegmentedControl!
    @IBOutlet weak var skill19Response: UISegmentedControl!
    @IBOutlet weak var skill20Response: UISegmentedControl!
    @IBOutlet weak var skill21Response: UISegmentedControl!
    @IBOutlet weak var skill22Response: UISegmentedControl!
    @IBOutlet weak var skill23Response: UISegmentedControl!
    @IBOutlet weak var skill24Response: UISegmentedControl!
    @IBOutlet weak var skill25Response: UISegmentedControl!
    @IBOutlet weak var skill26Response: UISegmentedControl!
    @IBOutlet weak var skill27Response: UISegmentedControl!
    @IBOutlet weak var skill28Response: UISegmentedControl!
    @IBOutlet weak var skill29Response: UISegmentedControl!
    @IBOutlet weak var skill30Response: UISegmentedControl!
    @IBOutlet weak var skill31Response: UISegmentedControl!
    @IBOutlet weak var start: UIView!
    @IBOutlet weak var cancel: UIView!
    
    var day = 0
    var today = ""
    var bedtime = ""
    var awake = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        start.layer.cornerRadius = 3.0
        start.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        start.layer.shadowOpacity = 0.3
        start.layer.shadowRadius = 1.0
        
        cancel.layer.cornerRadius = 3.0
        cancel.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        cancel.layer.shadowOpacity = 0.3
        cancel.layer.shadowRadius = 1.0
        
        switch day {
            case 1:
                dayLabel.text = "Monday"
            case 2:
                dayLabel.text = "Tuesday"
            case 3:
                dayLabel.text = "Wednesday"
            case 4:
                dayLabel.text = "Thursday"
            case 5:
                dayLabel.text = "Friday"
            case 6:
                dayLabel.text = "Saturday"
            case 7:
                dayLabel.text = "Sunday"
            default:
                dayLabel.text = ""
        }
        
        otherTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        otherTextField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        isCancel = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tipp" {
            let dest = segue.destination as! TippViewController
            dest.report = true
        }
        else if segue.identifier == "please" {
            let dest = segue.destination as! PleaseSkillViewController
            dest.report = true
        }
        else if segue.identifier == "pros" {
            let dest = segue.destination as! ProsViewController
            dest.report = true
        }
        else if segue.identifier == "facts" {
            let dest = segue.destination as! FactsViewController
            dest.report = true
        }
        else if segue.identifier == "improve" {
            let dest = segue.destination as! ImproveViewController
            dest.report = true
        }
        else if segue.identifier == "dearman" {
            let dest = segue.destination as! DearManViewController
            dest.report = true
        }
        else if segue.identifier == "fast" {
            let dest = segue.destination as! FastViewController
            dest.report = true
        }
        else if segue.identifier == "give" {
            let dest = segue.destination as! GiveViewController
            dest.report = true
        }
        else if segue.identifier == "radical" {
            let dest = segue.destination as! RadicalAcceptViewController
            dest.report = true
        }
        else if segue.identifier == "wise" {
            let dest = segue.destination as! WiseMindViewController
            dest.report = true
        }
        else if segue.identifier == "soothe"{
            let dest = segue.destination as! SootheViewController
            dest.report = true
        }
        else if segue.identifier == "observe" {
            let dest = segue.destination as! ObserveViewController
            dest.report = true
        }
        else if segue.identifier == "describe" {
            let dest = segue.destination as! DescribeViewController
            dest.report = true
        }
        else if segue.identifier == "judge" {
            let dest = segue.destination as! NonjudgementalViewController
            dest.report = true
        }
        else if segue.identifier == "longterm" {
            let dest = segue.destination as! LongTermViewController
            dest.report = true
        }
        else if segue.identifier == "mastery" {
            let dest = segue.destination as! BuildViewController
            dest.report = true
        }
        else if segue.identifier == "cope" {
            let dest = segue.destination as! CopingViewController
            dest.report = true
        }
        else if segue.identifier == "pleasant" {
            let dest = segue.destination as! PleasantViewController
            dest.report = true
        }
        else if segue.identifier == "participate" {
            let dest = segue.destination as! ParticipateViewController
            dest.report = true
        }
        else if segue.identifier == "solve" {
            let dest = segue.destination as! SolveViewController
            dest.report = true
        }
        else if segue.identifier == "effective" {
            let dest = segue.destination as! EffectiveViewController
            dest.report = true
        }
        else if segue.identifier == "onemind" {
            let dest = segue.destination as! OneMindViewController
            dest.report = true
        }
        else if segue.identifier == "values" {
            let dest = segue.destination as! ValsAndPriorsViewController
            dest.report = true
        }
        else if segue.identifier == "emotions" {
            let dest = segue.destination as! EmotionsViewController
            dest.report = true
        }
        else if segue.identifier == "reinforce" {
            let dest = segue.destination as! PosReinforceViewController
            dest.report = true
        }
        else if segue.identifier == "validate1" || segue.identifier == "validate2" {
            let dest = segue.destination as! ValidateViewController
            dest.report = true
        }
        else if segue.identifier == "thinkdia" || segue.identifier == "actdia" {
            let dest = segue.destination as! DialecticViewController
            dest.report = true
        }
        else if segue.identifier == "accepts" {
            let dest = segue.destination as! AcceptsViewController
            dest.report = true
        }
        else if !isCancel {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Day\(day)", in: context)
            let saveThis = NSManagedObject(entity: entity!, insertInto: context)
           
            let dateFormatter = DateFormatter()
            let dateFormatter1 = DateFormatter()

            dateFormatter.dateStyle = DateFormatter.Style.none
            dateFormatter.timeStyle = DateFormatter.Style.short
            
            dateFormatter1.dateStyle = DateFormatter.Style.short
            dateFormatter1.timeStyle = DateFormatter.Style.none

            bedtime = dateFormatter.string(from: wentToBed.date)
            awake = dateFormatter.string(from: wokeUp.date)
            today = dateFormatter1.string(from: todaysDate.date)
            
            //for yes/no values, 0 = yes and 1 = no
            saveThis.setValue(alcoholUrge.selectedSegmentIndex, forKey: "alcoholUrge")
            saveThis.setValue(alcoholAction.selectedSegmentIndex, forKey: "alcoholAction")
            saveThis.setValue(emotionAnger.selectedSegmentIndex, forKey: "anger")
            saveThis.setValue(emotionSad.selectedSegmentIndex, forKey: "sad")
            saveThis.setValue(emotionFear.selectedSegmentIndex, forKey: "fear")
            saveThis.setValue(emotionHappy.selectedSegmentIndex, forKey: "happy")
            saveThis.setValue(emotionShame.selectedSegmentIndex, forKey: "shame")
            saveThis.setValue(emotionMisery.selectedSegmentIndex, forKey: "misery")
            saveThis.setValue(emotionAnxious.selectedSegmentIndex, forKey: "anxious")
            saveThis.setValue(awake, forKey: "awake")
            saveThis.setValue(bedtime, forKey: "bedtime")
            saveThis.setValue(today, forKey: "date")
            saveThis.setValue(drugAction.selectedSegmentIndex, forKey: "drugsAction")
            saveThis.setValue(drugUrge.selectedSegmentIndex, forKey: "drugsUrge")
            saveThis.setValue(medsAction.selectedSegmentIndex, forKey: "meds")
            saveThis.setValue(cutClassAction.selectedSegmentIndex, forKey: "missClass")

            if otherTextField.text != "" {
                saveThis.setValue(otherAction.selectedSegmentIndex, forKey: "otherAction")
                saveThis.setValue(otherUrge.selectedSegmentIndex, forKey: "otherRank")
                saveThis.setValue(otherTextField?.text, forKey: "other")
            }

            saveThis.setValue(selfHarmAction.selectedSegmentIndex, forKey: "selfHarmAction")
            saveThis.setValue(selfHarmUrge.selectedSegmentIndex, forKey: "selfHarmUrge")
            saveThis.setValue(sexAction.selectedSegmentIndex, forKey: "sex")
            saveThis.setValue(suicidalAction.selectedSegmentIndex, forKey: "suicidalAction")
            saveThis.setValue(suicidalUrge.selectedSegmentIndex, forKey: "suicidalUrge")
            saveThis.setValue(skillsRange.selectedSegmentIndex, forKey: "skills")
            saveThis.setValue(skill1Response.selectedSegmentIndex, forKey: "skill1")
            saveThis.setValue(skill2Response.selectedSegmentIndex, forKey: "skill2")
            saveThis.setValue(skill3Response.selectedSegmentIndex, forKey: "skill3")
            saveThis.setValue(skill4Response.selectedSegmentIndex, forKey: "skill4")
            saveThis.setValue(skill5Response.selectedSegmentIndex, forKey: "skill5")
            saveThis.setValue(skill6Response.selectedSegmentIndex, forKey: "skill6")
            saveThis.setValue(skill7Response.selectedSegmentIndex, forKey: "skill7")
            saveThis.setValue(skill8Response.selectedSegmentIndex, forKey: "skill8")
            saveThis.setValue(skill9Response.selectedSegmentIndex, forKey: "skill9")
            saveThis.setValue(skill10Response.selectedSegmentIndex, forKey: "skill10")
            saveThis.setValue(skill11Response.selectedSegmentIndex, forKey: "skill11")
            saveThis.setValue(skill12Response.selectedSegmentIndex, forKey: "skill12")
            saveThis.setValue(skill13Response.selectedSegmentIndex, forKey: "skill13")
            saveThis.setValue(skill14Response.selectedSegmentIndex, forKey: "skill14")
            saveThis.setValue(skill15Response.selectedSegmentIndex, forKey: "skill15")
            saveThis.setValue(skill16Response.selectedSegmentIndex, forKey: "skill16")
            saveThis.setValue(skill17Response.selectedSegmentIndex, forKey: "skill17")
            saveThis.setValue(skill18Response.selectedSegmentIndex, forKey: "skill18")
            saveThis.setValue(skill19Response.selectedSegmentIndex, forKey: "skill19")
            saveThis.setValue(skill20Response.selectedSegmentIndex, forKey: "skill20")
            saveThis.setValue(skill21Response.selectedSegmentIndex, forKey: "skill21")
            saveThis.setValue(skill22Response.selectedSegmentIndex, forKey: "skill22")
            saveThis.setValue(skill23Response.selectedSegmentIndex, forKey: "skill23")
            saveThis.setValue(skill24Response.selectedSegmentIndex, forKey: "skill24")
            saveThis.setValue(skill25Response.selectedSegmentIndex, forKey: "skill25")
            saveThis.setValue(skill26Response.selectedSegmentIndex, forKey: "skill26")
            saveThis.setValue(skill27Response.selectedSegmentIndex, forKey: "skill27")
            saveThis.setValue(skill28Response.selectedSegmentIndex, forKey: "skill28")
            saveThis.setValue(skill29Response.selectedSegmentIndex, forKey: "skill29")
            saveThis.setValue(skill30Response.selectedSegmentIndex, forKey: "skill30")
            saveThis.setValue(skill31Response.selectedSegmentIndex, forKey: "skill31")
            
            do{
                try context.save()
            }catch{
                print("Save failed: \(error)")
            }
        }
    }

    @IBAction func unwindReport(_ sender: UIStoryboardSegue){}
}
