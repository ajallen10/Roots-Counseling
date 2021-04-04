//
//  SuggestionViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/12/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase
import FirebaseAuth

class SuggestionViewController: UIViewController {
    
    var emotion = 0
    var skill = ""
    var p = true
    var e = true
    var a = true
    var s = true
    var ex = true
    
    @IBOutlet weak var sugLabel: UILabel!
    @IBOutlet weak var trySkill: UIButton!
    @IBOutlet weak var next1: UIButton!
    @IBOutlet weak var main: UIButton!
    
    var please = false
    var pros = false
    var facts = false
    var tipp = false
    var stop = false
    var accepts = false
    var breathe = false
    var improve = false
    var soothe = false
    var opposite = false
    var isRoots = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        trySkill.layer.cornerRadius = 3.0
        trySkill.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        trySkill.layer.shadowOpacity = 0.3
        trySkill.layer.shadowRadius = 1.0
        
        next1.layer.cornerRadius = 3.0
        next1.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        next1.layer.shadowOpacity = 0.3
        next1.layer.shadowRadius = 1.0
        
        main.layer.cornerRadius = 3.0
        main.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        main.layer.shadowOpacity = 0.3
        main.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Crisis", in: context)
        let entity1 = NSEntityDescription.entity(forEntityName: "View", in: context)
        
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
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "View")
        request.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "emotion") != nil && str.value(forKey: "emotion") as! Int != 0 {
                    emotion = str.value(forKey: "emotion") as! Int
                }
            }
        }catch{
            print(error)
        }
        
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        let saveThis1 = NSManagedObject(entity: entity1!, insertInto: context)
        saveThis1.setValue("sug", forKey: "val")
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
        
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request1.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request1)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "skill") != nil {
                    skill = str.value(forKey: "skill") as! String
                }
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
            }
        }catch{
            print("Couldn't access Core Data \(error)")
        }
        
        if emotion == 1 || emotion == 2 || emotion == 3 || emotion == 4 {
            if please {
                if facts {
                    //other stuff
                    sugLabel.text = "Use your wise mind to determine the best skill to use. Contact your skills coach if necessary."
                    trySkill.isHidden = true
                }
                else {
                    sugLabel.text = "Try checking the facts."
                    saveThis.setValue("facts", forKey: "skill")
                }
            }
            else {
                trySkill.isHidden = true
                saveThis.setValue("please", forKey: "skill")
                
                if p && !e && a && !s && !ex {
                    sugLabel.text = "Considing eating something healthy, sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !s{
                    sugLabel.text = "Consider eating something healthy and sleeping. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and sleeping. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !s && !ex {
                    sugLabel.text = "Consider sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !e && a && !s && !ex {
                    sugLabel.text = "Consider exercising, eating something healthy and sleeping. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and getting some sleep. "
                }
                else if !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && a && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !ex {
                    sugLabel.text = "Consider getting some exercise. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep."
                }
                else if a && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising."
                }
                else if !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep."
                }
                else if !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a {
                    sugLabel.text = "Understand that you aren't feeling well and are under the influence of mood-altering substances. It would be wise to take care of yourself accordingly."
                }
                else if p && !e {
                    sugLabel.text = "Consider eating something healthy. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p {
                    sugLabel.text = "Understand that you aren't feeling well and take care of yourself accordingly."
                }
                else if !e {
                    sugLabel.text = "Consider eating something healthy."
                }
                else if a {
                    sugLabel.text = "Understand that you are under the influence of mood-altering substances and take care of yourself accordingly."
                }
                else if !s {
                    sugLabel.text = "Consider taking a nap or going to bed."
                }
                else if !ex {
                    sugLabel.text = "Consider exercising for at least half an hour."
                }
            }
        }
        else if emotion == 6 || emotion == 7 || emotion == 5 {
            if please {
                if stop {
                    if opposite{
                        if pros {
                            //other
                            sugLabel.text = "Contact your skills coach or use your wise mind to determine the best skill to use."
                            trySkill.isHidden = true
                        }
                        else {
                            sugLabel.text = "Try going through the pros and cons."
                            saveThis.setValue("pros", forKey: "skill")
                        }
                    }
                    else {
                        sugLabel.text = "Try engaging in opposite action."
                        saveThis.setValue("opposite", forKey: "skill")
                    }
                }
                else {
                    sugLabel.text = "Try the Stop skill."
                    saveThis.setValue("stop", forKey: "skill")
                }
            }
            else {
                trySkill.isHidden = true
                saveThis.setValue("please", forKey: "skill")
                
                if p && !e && a && !s && !ex {
                    sugLabel.text = "Considing eating something healthy, sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !s{
                    sugLabel.text = "Consider eating something healthy and sleeping. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and sleeping. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !s && !ex {
                    sugLabel.text = "Consider sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !e && a && !s && !ex {
                    sugLabel.text = "Consider exercising, eating something healthy and sleeping. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and getting some sleep. "
                }
                else if !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && a && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !ex {
                    sugLabel.text = "Consider getting some exercise. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep."
                }
                else if a && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising."
                }
                else if !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep."
                }
                else if !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a {
                    sugLabel.text = "Understand that you aren't feeling well and are under the influence of mood-altering substances. It would be wise to take care of yourself accordingly."
                }
                else if p && !e {
                    sugLabel.text = "Consider eating something healthy. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p {
                    sugLabel.text = "Understand that you aren't feeling well and take care of yourself accordingly."
                }
                else if !e {
                    sugLabel.text = "Consider eating something healthy."
                }
                else if a {
                    sugLabel.text = "Understand that you are under the influence of mood-altering substances and take care of yourself accordingly."
                }
                else if !s {
                    sugLabel.text = "Consider taking a nap or going to bed."
                }
                else if !ex {
                    sugLabel.text = "Consider exercising for at least half an hour."
                }
            }
        }
        else if emotion == 8 || emotion == 9 || emotion == 10 {
            if please {
                if tipp {
                    if breathe {
                        if soothe {
                            if improve {
                                if accepts {
                                    //other
                                    sugLabel.text = "Contact your skills coach or therapist as soon as possible."
                                    trySkill.isHidden = true
                                }
                                else {
                                    sugLabel.text = "Try the Wise Mind Accepts skill."
                                    saveThis.setValue("accepts", forKey: "skill")
                                }
                            }
                            else {
                                sugLabel.text = "Try improving the moment."
                                saveThis.setValue("improve", forKey: "skill")
                            }
                        }
                        else {
                            sugLabel.text = "Utilize your self-soothe kit."
                            saveThis.setValue("soothe", forKey: "skill")
                        }
                    }
                    else {
                        sugLabel.text = "Try square breathing."
                        saveThis.setValue("breathe", forKey: "skill")
                    }
                }
                else {
                    sugLabel.text = "Try using the TIPP skill."
                    saveThis.setValue("tipp", forKey: "skill")
                }
            }
            else {
                trySkill.isHidden = true
                saveThis.setValue("please", forKey: "skill")
                
                if p && !e && a && !s && !ex {
                    sugLabel.text = "Considing eating something healthy, sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !s{
                    sugLabel.text = "Consider eating something healthy and sleeping. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and sleeping. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !s && !ex {
                    sugLabel.text = "Consider sleeping and exercising. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !e && a && !s && !ex {
                    sugLabel.text = "Consider exercising, eating something healthy and sleeping. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !s && !ex {
                    sugLabel.text = "Consider eating something healthy, exercising and getting some sleep. "
                }
                else if !e && a && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && a && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a && !ex {
                    sugLabel.text = "Consider getting some exercise. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if p && !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you aren't feeling well and are under the influence of mood-altering substances. Based on your current condition, it would be wise to properly take care of yourself."
                }
                else if !s && !ex {
                    sugLabel.text = "Consider exercising and getting some sleep."
                }
                else if a && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if a && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if !e && !ex {
                    sugLabel.text = "Consider eating something healthy and exercising."
                }
                else if !e && !s {
                    sugLabel.text = "Consider eating something healthy and getting some sleep."
                }
                else if !e && a {
                    sugLabel.text = "Consider eating something healthy. Understand that you are also under the influence of mood-altering substances and need to take care of yourself accordingly."
                }
                else if p && !ex {
                    sugLabel.text = "If you are feeling up for it, consider exercising. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && !s {
                    sugLabel.text = "Consider getting some sleep. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p && a {
                    sugLabel.text = "Understand that you aren't feeling well and are under the influence of mood-altering substances. It would be wise to take care of yourself accordingly."
                }
                else if p && !e {
                    sugLabel.text = "Consider eating something healthy. Understand that you also aren't feeling well and need to take care of yourself accordingly."
                }
                else if p {
                    sugLabel.text = "Understand that you aren't feeling well and take care of yourself accordingly."
                }
                else if !e {
                    sugLabel.text = "Consider eating something healthy."
                }
                else if a {
                    sugLabel.text = "Understand that you are under the influence of mood-altering substances and take care of yourself accordingly."
                }
                else if !s {
                    sugLabel.text = "Consider taking a nap or going to bed."
                }
                else if !ex {
                    sugLabel.text = "Consider exercising for at least half an hour."
                }
            }
        }
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
    }
    
    @IBAction func trySkill(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request1.returnsObjectsAsFaults = false
        
        do{
            let result = try context.fetch(request1)
            for str in result as![NSManagedObject]{
                if str.value(forKey: "skill") != nil {
                    skill = str.value(forKey: "skill") as! String
                }
            }
        }catch{
            print(error)
        }
        
        if skill == "breathe" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "breathe")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "tipp" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "tipp")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "soothe" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "soothe")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "stop" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "stop")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "pros" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "pros")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "accepts" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "accepts")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "improve" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "improve")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "facts" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "facts")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else if skill == "opposite" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "opposite")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
    }
    
    @IBAction func main(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func next(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Crisis", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        
        if emotion == 1 || emotion == 2 || emotion == 3 || emotion == 4 {
            if please {
                if facts {
                    saveThis.setValue(true, forKey: "coach")
                    saveThis.setValue("coach", forKey: "skill")
                }
                else {
                    saveThis.setValue(true, forKey: "facts")
                    saveThis.setValue("facts", forKey: "skill")
                }
            }
            else {
                saveThis.setValue(true, forKey: "please")
                saveThis.setValue("please", forKey: "skill")
            }
        }
        else if emotion == 6 || emotion == 7 || emotion == 5 {
            if please {
                if stop {
                    if opposite{
                        if pros {
                            saveThis.setValue(true, forKey: "coach")
                            saveThis.setValue("coach", forKey: "skill")
                        }
                        else {
                            saveThis.setValue(true, forKey: "pros")
                            saveThis.setValue("pros", forKey: "skill")
                        }
                    }
                    else {
                        saveThis.setValue(true, forKey: "opposite")
                        saveThis.setValue("opposite", forKey: "skill")
                    }
                }
                else {
                    saveThis.setValue(true, forKey: "stop")
                    saveThis.setValue("stop", forKey: "skill")
                }
            }
            else {
                saveThis.setValue(true, forKey: "please")
                saveThis.setValue("please", forKey: "skill")
            }
        }
        else if emotion == 8 || emotion == 9 || emotion == 10 {
            if please {
                if tipp {
                    if breathe {
                        if soothe {
                            if improve {
                                if accepts {
                                    saveThis.setValue(true, forKey: "coach")
                                    saveThis.setValue("coach", forKey: "skill")
                                }
                                else {
                                    saveThis.setValue(true, forKey: "accepts")
                                    saveThis.setValue("accepts", forKey: "skill")
                                }
                            }
                            else {
                                saveThis.setValue(true, forKey: "improve")
                                saveThis.setValue("improve", forKey: "skill")
                            }
                        }
                        else {
                            saveThis.setValue(true, forKey: "soothe")
                            saveThis.setValue("soothe", forKey: "skill")
                        }
                    }
                    else {
                        saveThis.setValue(true, forKey: "breathe")
                        saveThis.setValue("breathe", forKey: "skill")
                    }
                }
                else {
                    saveThis.setValue(true, forKey: "tipp")
                    saveThis.setValue("tipp", forKey: "skill")
                }
            }
            else {
                saveThis.setValue(true, forKey: "please")
                saveThis.setValue("please", forKey: "skill")
            }
        }
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "rate")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
