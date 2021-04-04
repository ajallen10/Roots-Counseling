
//  SecondViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/14/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    var viewC = ""
    @IBOutlet weak var resume: UIButton!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var phone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        resume.layer.cornerRadius = 3.0
        resume.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        resume.layer.shadowOpacity = 0.3
        resume.layer.shadowRadius = 1.0
        
        start.layer.cornerRadius = 3.0
        start.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        start.layer.shadowOpacity = 0.3
        start.layer.shadowRadius = 1.0
        
        phone.layer.cornerRadius = 3.0
        phone.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        phone.layer.shadowOpacity = 0.3
        phone.layer.shadowRadius = 1.0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "View")
        request.returnsObjectsAsFaults = false
        
        if let result = try? context.fetch(request){
            for str in result as! [NSManagedObject]{
                if str.value(forKey: "val") != nil {
                    viewC = str.value(forKey: "val") as! String
                }
            }
        }
        
        if viewC != "" {
            resume.setTitleColor(UIColor.black, for: .normal)
            resume.isEnabled = true
        }
        else {
            resume.setTitleColor(UIColor.white, for: .normal)
            resume.isEnabled = false
        }
    }
    
    @IBAction func start(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
        request.returnsObjectsAsFaults = false
        
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
        let mainTabBarController = storyboard.instantiateViewController(identifier: "scale")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func resume(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: viewC)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func unwindSecond(_ sender: UIStoryboardSegue){}
}

