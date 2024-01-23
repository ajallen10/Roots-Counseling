//
//  LogoutViewController.swift
//  RootsCapstoneProj
//
//  Created by Abby Allen on 7/27/20.
//  Copyright © 2020 Abby Allen. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreData

class LogoutViewController: UIViewController {
    @IBOutlet weak var orientation: UIButton!
    @IBOutlet weak var week: UIButton!
    @IBOutlet weak var crisis: UIButton!
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var journal: UIButton!
    @IBOutlet weak var manage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .portrait
        
        orientation.layer.cornerRadius = 3.0
        orientation.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        orientation.layer.shadowOpacity = 0.3
        orientation.layer.shadowRadius = 1.0
        
        week.layer.cornerRadius = 3.0
        week.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        week.layer.shadowOpacity = 0.3
        week.layer.shadowRadius = 1.0
        
        crisis.layer.cornerRadius = 3.0
        crisis.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        crisis.layer.shadowOpacity = 0.3
        crisis.layer.shadowRadius = 1.0
        
        logout.layer.cornerRadius = 3.0
        logout.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        logout.layer.shadowOpacity = 0.3
        logout.layer.shadowRadius = 1.0
        
        manage.layer.cornerRadius = 3.0
        manage.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        manage.layer.shadowOpacity = 0.3
        manage.layer.shadowRadius = 1.0
        
        journal.layer.cornerRadius = 3.0
        journal.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        journal.layer.shadowOpacity = 0.3
        journal.layer.shadowRadius = 1.0
    }

    @IBAction func logout(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        for i in 1...7 {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Day\(i)")
                
            if let result = try? context.fetch(request){
                for str in result as! [NSManagedObject]{
                    context.delete(str)
                }
            }
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Done")
            
        if let result = try? context.fetch(request){
            for str in result as! [NSManagedObject]{
                context.delete(str)
            }
        }
        
        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
            
        if let result = try? context.fetch(request1){
            for str in result as! [NSManagedObject]{
                context.delete(str)
            }
        }
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "IsRoots")
            
        if let result = try? context.fetch(request2){
            for str in result as! [NSManagedObject]{
                context.delete(str)
            }
        }
            
        do{
            try context.save()
        }catch{
            print("failed \(error)")
        }
        
        do {
          try Auth.auth().signOut()
        } catch {
          print("Sign out error")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "SignInViewController")

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
//    @IBAction func deleteAcc(_ sender: Any) {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        for i in 1...7 {
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Day\(i)")
//
//            if let result = try? context.fetch(request){
//                for str in result as! [NSManagedObject]{
//                    context.delete(str)
//                }
//            }
//        }
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Done")
//
//        if let result = try? context.fetch(request){
//            for str in result as! [NSManagedObject]{
//                context.delete(str)
//            }
//        }
//
//        let request1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Crisis")
//
//        if let result = try? context.fetch(request1){
//            for str in result as! [NSManagedObject]{
//                context.delete(str)
//            }
//        }
//
//        do{
//            try context.save()
//        }catch{
//            print("failed \(error)")
//        }
//
//        let user = Auth.auth().currentUser
//
//        user?.delete { error in
//            if let error = error {
//                print(error)
//            } else {
//                print("Successfully deleted")
//            }
//        }
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let loginNavController = storyboard.instantiateViewController(identifier: "SignInViewController")
//
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
//    }
    
    @IBAction func unwindLog(_ sender: UIStoryboardSegue){}
}
