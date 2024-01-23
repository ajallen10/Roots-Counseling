//
//  EmotionScaleViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 8/12/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData
import FirebaseAuth

class EmotionScaleViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var scale: UISegmentedControl!
    @IBOutlet weak var explanation: UITextView!
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var mainMenu: UIButton!
    var isRoots = ""
    var emotion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextB.layer.cornerRadius = 3.0
        nextB.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        nextB.layer.shadowOpacity = 0.3
        nextB.layer.shadowRadius = 1.0
        
        mainMenu.layer.cornerRadius = 3.0
        mainMenu.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        mainMenu.layer.shadowOpacity = 0.3
        mainMenu.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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
        
        explanation.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            explanation.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func submit(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "View", in: context)
        let saveThis = NSManagedObject(entity: entity!, insertInto: context)
        saveThis.setValue(scale.selectedSegmentIndex + 1, forKey: "emotion")
        
        let entity1 = NSEntityDescription.entity(forEntityName: "Crisis", in: context)
        let saveThis1 = NSManagedObject(entity: entity1!, insertInto: context)
        saveThis1.setValue(explanation.text!, forKey: "explan")
        
        do{
            try context.save()
        }catch{
            print("Save failed: \(error)")
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "please")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func home(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
